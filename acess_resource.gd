extends Node

var name_dir = "/GameConfig/"
var path_Appdata = OS.get_user_data_dir() + name_dir
var full_path = path_Appdata + name_dir + "gameobj.tres"


func resource_exits():
	var dir = Directory.new()
	return bool(dir.dir_exists(path_Appdata))

func save_resource(obj_config: GameConfig):
	ResourceSaver.save(full_path,obj_config)

func get_resource():
	if resource_exits():
		var Gameobj = ResourceLoader.load(full_path)
		return Gameobj.duplicate()
	else:
		return create_resource()

func create_resource():
	var obj_gameconfig = GameConfig.new()
	var dir = Directory.new()
	dir.make_dir_recursive(path_Appdata)
	save_resource(obj_gameconfig)
	return obj_gameconfig
