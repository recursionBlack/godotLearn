extends Area2D


func _physics_process(delta: float) -> void:
	for i in get_overlapping_areas():
		if i.is_in_group("Ball"):
			i.vec.x = 5
	var y1 = Input.get_action_strength("玩家1上")*5
	var y2 = Input.get_action_strength("玩家1下")*5
	var y3 = self.position.y - y1 + y2
	if y3 > 16:
		if y3 < 630:
			self.position.y = self.position.y - y1 + y2
	pass
