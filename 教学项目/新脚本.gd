class_name person

extends RefCounted

var name:String = ""
var age:int = 0

func _init(p_name:String) -> void:
	name = p_name
	print(name, "出生了")
	
func one_year_past():
	self.age += 1
	
func _notification(what: int) -> void:
	if what == 1:
		print(name, "死了")
		print("终年", age, "岁")
