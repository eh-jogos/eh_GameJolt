tool
class_name MarkdownDocsExporter
extends JsonIO
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants
const MD_BLOCK_INHERITANCE = ""\
		+"**Inherits:** _{inheritance}_  \n"
const MD_BLOCK_INHERITED_BY = ""\
		+"**Inherited by:** _{inherited_by}_  \n"\
		+"\n"
const MD_BLOCK_TITLE = ""\
		+"# {title}  \n"\
		+"\n"
const MD_BLOCK_DESCRIPTION = ""\
		+"## Description  \n"\
		+"{description}"\
		+"\n"
const MD_BLOCK_PROPERTIES_DESCRIPTION = ""\
		+"## Properties Description  \n"\
		+"\n"
const MD_BLOCK_PROPERTY = ""\
		+"- {type} **{name}**  \n"\
		+"{table}"\
		+"{description}  \n"\
		+"```gdscript  \n"\
		+"{signature}  \n"\
		+"```  \n"\
		+"---------\n"


# public variables - order: export > normal var > onready 

var links_db: = {}

# private variables - order: export > normal var > onready 
### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	pass

func _run() -> void:
	export_github_wiki_pages("res://reference.json", "res://.github-wiki/")

### ---------------------------------------


### Public Methods ------------------------

func export_github_wiki_pages(reference_json_path: String, export_path: String) -> void:
	var reference_dict : = _get_dictionary_from_file(reference_json_path)
	if reference_dict.has("error"):
		push_error(reference_dict.error)
		return
	
	for entry in reference_dict.classes:
		var md_filename: = "%s.md" % [entry.name.to_lower()]
		var category: String = entry.category if entry.has("category") else ""
		var md_file_path: = _get_md_filepath(export_path, md_filename, category)
		
		_update_links_db(entry.name, category)
		
		var md_content: = _get_inheritance_block(entry)
		md_content += MD_BLOCK_TITLE.format({title=entry.name})
		md_content += MD_BLOCK_DESCRIPTION.format({description=entry.description})
		md_content += MD_BLOCK_PROPERTIES_DESCRIPTION
		md_content += _get_properties_block(entry)
		
		_write_documentation_file(md_content, md_file_path)
	
	print(JSON.print(links_db," "))
	
	print("Success!")

### ---------------------------------------


### Private Methods -----------------------

func _get_md_filepath(export_path: String, filename: String, category: = "") -> String:
	if not export_path.ends_with("/"):
		export_path += "/"
	
	if not category.ends_with("/") and category != "":
		category += "/"
	
	var filepath: = "%s%s%s"%[export_path, category, filename]
	return filepath


func _update_links_db(entry_name: String, category: String) -> void:
	var lowercase_name = entry_name.to_lower()
	
	var sanitized_category = ""
	if category.ends_with("/"):
		sanitized_category = category.rstrip("/").to_lower()
	else:
		sanitized_category = category.to_lower()
	
	var full_path = ""
	if sanitized_category == "":
		full_path = lowercase_name
	else:
		full_path = "/%s/%s/"%[sanitized_category, lowercase_name]
	
	links_db[entry_name] = {
			local_path = lowercase_name,
			full_path = full_path
	}


func _get_inheritance_block(docs_entry: Dictionary) -> String:
	var content: = ""
	content += MD_BLOCK_INHERITANCE.format({
				inheritance=str(docs_entry.extends_class)\
					.replace("[","").replace("]","").replacen(", "," > "), 
		})
		
	if docs_entry.has("inherited_by"):
		content += MD_BLOCK_INHERITED_BY.format({
				inherited_by=str(docs_entry.inherited_by).replace("[","").replace("]","")
		})
	
	return content


func _get_properties_block(docs_entry: Dictionary) -> String:
	var content: = ""
	if not docs_entry.members.empty():
		for property in docs_entry.members:
			if property.name.begins_with("_"):
				continue
			
			var table = "<table><tbody>  \n"
			if property.default_value != null:
				table += "<tr> <th>_Default_</th> <th>`%s`</th> </tr>  \n"%[property.default_value]
			if property.setter != "":
				table += "<tr> <th>_Setter_</th> <th>%s</th> </tr>  \n"%[property.setter]
			if property.getter != "":
				table += "<tr> <th>_Getter_</th> <th>%s</th> </tr>  \n"%[property.getter]
			table += "</tbody></table>"
			if table == "<table><tbody>  \n</tbody></table>":
				table = ""
			
			content += MD_BLOCK_PROPERTY.format({
				type = property.data_type,
				name = property.name,
				table = table,
				description = property.description,
				signature = property.signature
			})
	
	return content


func _write_documentation_file(p_content: String, p_file_path: String) -> void:
	var directory := Directory.new()
	if not directory.dir_exists(p_file_path.get_base_dir()):
		directory.make_dir_recursive(p_file_path.get_base_dir())
	
	var docs_file := File.new()
	var error = docs_file.open(p_file_path, File.WRITE)
	if error != OK:
		_push_reading_file_error(error, p_file_path)
		return
	docs_file.store_string(p_content)
	docs_file.close()

### ---------------------------------------


