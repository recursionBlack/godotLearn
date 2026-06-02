extends Node

var person1

func _ready() -> void:
	person1 = person.new("李老四")
	var person2 = load("res://新脚本.gd").new("王五")
	person2.one_year_past()
