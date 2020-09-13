tool
class_name HugoMarkdownDocsExporter
extends MarkdownDocsExporter
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants

const HUGO_DEFAULT_FRONT_MATTER = ""\
		+"---  \n"\
		+"title: {title}  \n"\
		+"author: {author}  \n"\
		+"date: {datetime}  \n"\
		+"summary: {summary}  \n"\
		+"---  \n"  

const HUGO_CHAPTER_FRONT_MATTER = ""\
		+"---  \n"\
		+"title: {title}  \n"\
		+"author: {author}  \n"\
		+"date: {datetime}  \n"\
		+"summary: {summary}  \n"\
		+"---  \n"  

const HUGO_BLOCK_PROPERTY = ""\
		+"### {name} \n"\
		+"- {property_signature}  \n"\
		+"  \n"\
		+"{table}"\
		+"{description}  \n"\
		+"---------\n"

# public variables - order: export > normal var > onready 

var author: = "eh-jogos"
var date: = ""

# private variables - order: export > normal var > onready 

var _category_db: = {}

### ---------------------------------------


### Built in Engine Methods ---------------

func _init():
	key_to_use_for_link = "full_path"
	property_block = HUGO_BLOCK_PROPERTY


func _run() -> void:
	export_hugo_site_pages("res://reference.json", "res://.docs-site/content/reference/")

### ---------------------------------------


### Public Methods ------------------------

func export_hugo_site_pages(reference_json_path: String, export_path: String) -> void:
	_category_db.clear()
	var reference_dict : = _get_dictionary_from_file(reference_json_path)
	if reference_dict.has("error"):
		push_error(reference_dict.error)
		return
	
	for entry in reference_dict.classes:
		_update_links_db(entry, export_path)
	
	for entry in reference_dict.classes:
		_update_signatures_db(entry)
	
	for entry in reference_dict.classes:
		var md_filename: = "%s.md" % [entry.name.to_lower()]
		var category: String = entry.category if entry.has("category") else ""
		var md_file_path: = _get_md_filepath(export_path, md_filename, category.to_lower())
		
		_add_category_to_db(category)
		
		var md_content: = _get_hugo_front_matter(entry.name)
		md_content += _get_inheritance_block(entry)
		md_content += _get_description_block(entry)
		md_content += MD_BLOCK_PROPERTIES_DESCRIPTION
		md_content += _get_properties_block(entry)
		md_content += MD_BLOCK_METHOD_DESCRIPTION
		md_content += _get_method_block(entry)
		
		_write_documentation_file(md_content, md_file_path)
	
	for category in _category_db:
		var md_filename = "_index.md"
		var md_file_path =  _get_md_filepath(export_path, md_filename, category.to_lower())
		
		var name = (category as String).replace(category.get_base_dir()+"/", "")
		var md_content: = _get_hugo_front_matter(name, true)
		
		_write_documentation_file(md_content, md_file_path)
	
	print("Success!")

### ---------------------------------------


### Private Methods -----------------------

func _get_hugo_front_matter(title: String, is_chapter: = false) -> String:
	var formated_date = date
	if formated_date == "":
		var datetime: = OS.get_datetime()
		var timezone: String = OS.get_time_zone_info().name
		if timezone.find(":") == -1:
			timezone += ":00"
		formated_date = "{year}-{month}-{day}T{hour}:{minute}:{second}{timezone}".format({
				year = datetime.year,
				month = "%02d" % [datetime.month],
				day = "%02d" % [datetime.day],
				hour = "%02d" % [datetime.hour],
				minute = "%02d" % [datetime.minute],
				second = "%02d" % [datetime.second],
				timezone = timezone,
		})
	
	var front_matter: = ""
	if is_chapter:
		front_matter = HUGO_CHAPTER_FRONT_MATTER.format({
				author = author,
				datetime = formated_date,
				title = title,
				summary = ""
		})
	else:
		front_matter = HUGO_DEFAULT_FRONT_MATTER.format({
				author = author,
				datetime = formated_date,
				title = title,
				summary = ""
		})
	
	return front_matter


func _add_category_to_db(category: String) -> void:
	if category == "":
		return
	
	if not category.ends_with("/"):
		category += "/"
	
	var base_dirs = []
	while (category.get_base_dir() != ""):
		var base_dir = category.get_base_dir()
		base_dirs.push_back(base_dir)
		category = base_dir
	
	for base_dir in base_dirs:
		if not _category_db.has(base_dir):
			_category_db[base_dir] = {
				description = ""
			}


func _add_link_to_keyword(text: String, split_index: int, link: String) -> String:
	var left = text.left(split_index)
	var right = text.right(split_index)
	text = "%s({{< ref \"%s\" >}})%s"%[left, link, right]
	return text


func _add_link_to_keyword_section(text: String, split_index: int, 
		link: String, hash_link: String, keyword: String = "") -> String:
	var left = text.left(split_index)
	var right = text.right(split_index)
	
	if keyword != "":
		left = left.replace(keyword, hash_link)
	
	text = "%s({{< ref \"%s#%s\" >}})%s"%[left, link, hash_link, right]
	return text


func _get_property_details_table(property: Dictionary) -> String:
	var table = "| | |  \n"
	table +=    "| - |:-:|  \n"
	
	if property.default_value != null:
		var default_value = property.default_value
		if typeof(default_value) == TYPE_STRING:
			default_value = "\"%s\""%[default_value]
		table += "| _Default_ | ` %s ` |  \n"%[default_value]
	
	if property.setter != "":
		table += "| _Setter_ | %s |  \n"%[property.setter]
	
	if property.getter != "":
		table += "| _Getter_ | %s |  \n"%[property.getter]
	
	table += "\n"
	
	if table == "| | |  \n| - |:-:|  \n\n":
		table = ""
	
	return table

### ---------------------------------------


