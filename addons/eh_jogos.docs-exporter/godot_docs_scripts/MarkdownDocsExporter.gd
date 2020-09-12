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
		+"- ### _{type}_ {name}  \n"\
		+"{table}"\
		+"{description}  \n"\
		+"---------\n"

const GODOT_DOCS_BASE_URL = "https://docs.godotengine.org/en/stable/classes/class_%s.html"

# public variables - order: export > normal var > onready 

var links_db: = {}

# private variables - order: export > normal var > onready 

var _shared_variables_path = "res://addons/eh_jogos.docs-exporter/editor_uis/shared_variables/"
var _custom_class_db : DictionaryVariable
var _custom_inheritance_db : DictionaryVariable

### ---------------------------------------


### Built in Engine Methods ---------------
func _init():
	_custom_class_db = load(_shared_variables_path + "dict_custom_class_db.tres")
	_custom_inheritance_db = load(_shared_variables_path + "dict_custom_inheritance_db.tres")


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
		_update_links_db(entry, export_path)
	
	for entry in reference_dict.classes:
		var md_filename: = "%s.md" % [entry.name.to_lower()]
		var category: String = entry.category if entry.has("category") else ""
		var md_file_path: = _get_md_filepath(export_path, md_filename, category)
		
		var md_content: = _get_inheritance_block(entry)
		md_content += MD_BLOCK_TITLE.format({title=entry.name})
		md_content += _get_description_block(entry)
		md_content += MD_BLOCK_PROPERTIES_DESCRIPTION
		md_content += _get_properties_block(entry)
		
		_write_documentation_file(md_content, md_file_path)
	
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


func _update_links_db(class_entry: Dictionary, export_path: String) -> void:
	var category: String = class_entry.category if class_entry.has("category") else ""
	var lowercase_name = class_entry.name.to_lower()
	
	var sanitized_category = ""
	if category.ends_with("/"):
		sanitized_category = category.rstrip("/").to_lower()
	else:
		sanitized_category = category.to_lower()
	
	if export_path.ends_with("/"):
			export_path = export_path.left(export_path.length()-1)
	
	var full_path = ""
	if sanitized_category == "":
		if export_path.get_file() == "content":
			full_path = lowercase_name
		else:
			full_path = "/%s/%s"%[export_path.get_file(), lowercase_name]
	else:
		if export_path.get_file() == "content":
			full_path = "/%s/%s"%[sanitized_category, lowercase_name]
		else:
			full_path = "/%s/%s/%s"%[export_path.get_file(),sanitized_category, lowercase_name]
	
	var objects: = _get_objects_for_links_db(class_entry)
	
	links_db[class_entry.name] = {
			local_path = lowercase_name,
			full_path = full_path,
			objects = objects,
	}


func _get_objects_for_links_db(class_entry: Dictionary) -> Array:
	var objects: = []
	for object in class_entry.sub_classes:
		objects.push_back(object.name)
	for object in class_entry.constants:
		objects.push_back(object.name)
	for object in class_entry.members:
		objects.push_back(object.name)
	for object in class_entry.signals:
		objects.push_back(object.name)
	for object in class_entry.methods:
		objects.push_back(object.name)
	for object in class_entry.static_functions:
		objects.push_back(object.name)
	return objects


func _get_inheritance_block(docs_entry: Dictionary) -> String:
	var content: = ""
	
	var inheritance_string: = _format_array_into_string(
			docs_entry.extends_class, " > ", docs_entry.name)
	
	content += MD_BLOCK_INHERITANCE.format({
				inheritance=inheritance_string, 
		})
		
	if docs_entry.has("inherited_by"):
		var inherited_by_string = _format_array_into_string(
				docs_entry.inherited_by, ", ", docs_entry.name)
		
		content += MD_BLOCK_INHERITED_BY.format({
				inherited_by=inherited_by_string
		})
	
	return content


func _format_array_into_string(p_array: Array, delimiter: String, p_class_name: String) -> String:
	var formatted_string: = ""
	for entry in p_array:
		var keyword = "[%s]"%[entry]
		var treated_text = _check_for_links(keyword, p_class_name)
		formatted_string += "%s%s"%[treated_text, delimiter]
	
	formatted_string = formatted_string.left(formatted_string.length()-delimiter.length())
	return formatted_string


func _get_description_block(docs_entry: Dictionary) -> String:
	var text = MD_BLOCK_DESCRIPTION.format({description=docs_entry.description})
	text = _check_for_links(text, docs_entry.name)
	
	return text


func _check_for_links(text: String, p_class_name: String) -> String:
	if not text.match("*[*]*"):
		return text
	
	var search_index = 0
	while search_index > -1:
		var start_index = text.find("[", search_index)
		var end_index = text.find("]", start_index)
		
		if start_index == -1 or end_index == -1 or end_index < start_index:
			search_index = -1
			break
		
		search_index = end_index
		
		var keyword = _get_link_keyword(text, start_index + 1, end_index)
		var nested_link = _get_nested_link(keyword)
		
		text = _handle_links_in_text(text, end_index + 1, keyword, nested_link, p_class_name)
	
	return text 


func _get_link_keyword(text: String, start_index: int, end_index: int) -> String:
	var length = end_index - start_index
	var keyword = text.substr(start_index, length)
	return keyword


func _get_nested_link(keyword: String) -> Array:
	var nested_link = []
	if keyword.find("."):
		nested_link = keyword.split(".")
	return nested_link


func _add_link_to_keyword(text: String, split_index: int, link: String) -> String:
	var left = text.left(split_index)
	var right = text.right(split_index)
	text = "%s(%s)%s"%[left, link, right]
	return text


func _add_external_link_to_keyword(text: String, split_index: int, link: String) -> String:
	var left = text.left(split_index)
	var right = text.right(split_index)
	text = "%s(%s)%s"%[left, link, right]
	return text


func _add_link_to_keyword_section(text: String, split_index: int, 
		link: String, hash_link: String, keyword: String = "") -> String:
	var left = text.left(split_index)
	var right = text.right(split_index)
	
	if keyword != "":
		left = left.replace(keyword, hash_link)
	
	text = "%s(%s#%s)%s"%[left, link, hash_link, right]
	return text


func _handle_links_in_text(text: String, split_index: int, 
		keyword: String, nested_link: Array, page_name: String) -> String:
	if ClassDB.class_exists(keyword):
		var link = GODOT_DOCS_BASE_URL%[keyword.to_lower()]
		text = _add_external_link_to_keyword(text, split_index, link)
	elif links_db.has(keyword):
		text = _add_link_to_keyword(text, split_index, links_db[keyword].local_path)
	elif not nested_link.empty() and links_db.has(nested_link[0]):
		text = _add_link_to_keyword_section(
				text, 
				split_index, 
				links_db[nested_link[0]].local_path, 
				nested_link[1], 
				keyword
		)
	elif links_db[page_name].objects.has(keyword):
		text = _add_link_to_keyword_section(
				text, 
				split_index, 
				links_db[page_name].local_path, 
				keyword
		)
	
	return text


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


