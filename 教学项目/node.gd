extends Node

func _input(event) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed == true:
				print("鼠标左键处于按下的状态")
				# 表示鼠标事件已处理，不用再向下传递了，如果没有这句，_unhandled_input将也会执行
				$HBoxContainer/SubViewportContainer2/SubViewport.set_input_as_handled()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed == true:
				print("鼠标左键处于按下的状态")
							
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# 将两个视窗对齐为同一个2d世界
	$HBoxContainer/SubViewportContainer2/SubViewport.world_2d=$HBoxContainer/SubViewportContainer/SubViewport.world_2d
	# 用代码创建一个鼠标点击事件
	var s = InputEventMouseButton.new()
	s.button_index = 1
	s.pressed = true
	$HBoxContainer/SubViewportContainer/SubViewport.push_input(s)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
