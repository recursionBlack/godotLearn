extends Node

var a:int = 1  
# 必须以字母或下划线开头
# 变量名的其他元素，也必须是字母、下划线、数字
var b:float = 2.6
var c: String = "Hello"
var d:bool = true
var e = false
var v = Vector2(1,1)

func _enter_tree() -> void:
	a = b * 2
	v.x = 16
	print(v)
	pass
