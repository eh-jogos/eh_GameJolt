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
var should_create_toc_on_category_pages: = true

# private variables - order: export > normal var > onready 

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
		_build_and_save_md(entry, export_path)
	
	for category in _category_db:
		var md_filename = "_index.md"
		var md_file_path =  _get_md_filepath(export_path, md_filename, category.to_lower())
		
		var name = (category as String).replace(category.get_base_dir()+"/", "")
		var md_content: = _get_hugo_front_matter(name, true)
		md_content += "%s  \n"%[_category_db[category].description]
		md_content += _get_link_tree(_category_db[category])
		
		_write_documentation_file(md_content, md_file_path)
	
	print("Success!")

### ---------------------------------------


### Private Methods -----------------------
func _build_and_save_md(docs_entry: Dictionary, export_path: String) -> void:
	var category: String = docs_entry.category if docs_entry.has("category") else ""
	_add_to_category_db(category, docs_entry.name)
	
	var md_filename: = "%s.md" % [docs_entry.name]
	var md_file_path: = _get_md_filepath(export_path, md_filename, category.to_lower())
	
	var md_content: = _get_md_content(docs_entry)
	
	_write_documentation_file(md_content, md_file_path)


func _get_md_content(docs_entry: Dictionary) -> String:
	var md_content = _get_hugo_front_matter(docs_entry.name)
	md_content += ._get_md_content(docs_entry)
	
	return md_content


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


func _get_link_tree(dict : Dictionary, identation: = "") -> String:
	var link_tree: = ""
	
	if dict.has("page_titles"):
		for page in dict.page_titles:
			var link_path = links_db[page].full_path
			link_tree += "%s- [%s](%s)  \n"%[identation, page, link_path]
	
	for key in dict.keys():
		if key == "page_titles" or key == "description":
			continue
		
		link_tree += "%s- **%s**  \n"%[identation, key]
		link_tree += _get_link_tree(dict[key], identation+"  ")
	
	return link_tree


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


