extends Area2D

signal abc

func _ready() -> void:
	# await 用法
	var time = get_tree().create_timer(3)
	await time.timeout
	# 准备阶段，将信号与槽函数绑定
	self.abc.connect(a)
	abc.emit(12)
	
func a(b):
	print(b)
func _physics_process(delta: float) -> void:
	for i in get_overlapping_areas():
		if i.is_in_group("Ball"):
			var a = self.get_node("sound")
			a.play()
			i.vec.x = 5
	var y1 = Input.get_action_strength("玩家1上")*5
	var y2 = Input.get_action_strength("玩家1下")*5
	var y3 = self.position.y - y1 + y2
	if y3 > 16:
		if y3 < 630:
			self.position.y = self.position.y - y1 + y2
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Ball"):
		area.vec.x = 5
	pass # Replace with function body.
