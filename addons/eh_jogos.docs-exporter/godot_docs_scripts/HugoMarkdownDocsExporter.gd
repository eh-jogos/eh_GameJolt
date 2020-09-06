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

const HUGO_BLOCK_PROPERTY = ""\
		+"- ### **{type}** {name}  \n"\
		+"{table}"\
		+"{description}  \n"\
		+"---------\n"

# public variables - order: export > normal var > onready 

var author: = "eh-jogos"
var date: = ""

# private variables - order: export > normal var > onready 
### ---------------------------------------


### Built in Engine Methods ---------------
func _run() -> void:
	export_path = "res://.docs-site/content/reference/"
	var reference_dict : = _get_dictionary_from_file(reference_json)
	if reference_dict.has("error"):
		push_error(reference_dict.error)
		return
	
	for entry in reference_dict.classes:
		var md_filename: = "%s.md" % [entry.name.to_lower()]
		var md_file_path: = "%s/%s"%[export_path.get_base_dir(), md_filename]
		
		
		var md_content: = _get_hugo_front_matter(entry.name)
		md_content += _get_inheritance_block(entry)
		md_content += MD_BLOCK_DESCRIPTION.format({description=entry.description})
		md_content += MD_BLOCK_PROPERTIES_DESCRIPTION
		md_content += _get_properties_block(entry)
		
		_write_documentation_file(md_content, md_file_path)
		
	print("Success!")
	pass
### ---------------------------------------


### Public Methods ------------------------
### ---------------------------------------


### Private Methods -----------------------

func _get_hugo_front_matter(title: String) -> String:
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
	
	var front_matter: = HUGO_DEFAULT_FRONT_MATTER.format({
			author = author,
			datetime = formated_date,
			title = title,
			summary = ""
	})
	return front_matter

func _get_properties_block(docs_entry: Dictionary) -> String:
	var content: = ""
	if not docs_entry.members.empty():
		for property in docs_entry.members:
			if property.name.begins_with("_"):
				continue
			
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
			
			content += HUGO_BLOCK_PROPERTY.format({
				type = property.data_type,
				name = property.name,
				table = table,
				description = property.description,
				signature = property.signature
			})
	
	return content

### ---------------------------------------


