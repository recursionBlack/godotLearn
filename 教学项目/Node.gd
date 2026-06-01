extends Node

func _enter_tree() -> void:
	var d = self.add(3, 5)
	print(d)
	
func add(a:int, b:int=16)->int:
	var c = a+b
	return c
	print("Hello")
	pass
