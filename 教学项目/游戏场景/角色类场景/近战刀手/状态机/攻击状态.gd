extends Base_State

func enter():
	if $Timer.is_stopped():
		$"../../AnimationPlayer".play("攻击1")
	else:
		$"../../AnimationPlayer".play("攻击2")
	
	
func do():
	pass

func attack1_check():
	var arr = $"../../AtkCheck/A1".get_overlapping_bodies()

func attack2l_check():
	var arr = $"../../AtkCheck/A2l".get_overlapping_bodies()

func attack2r_check():
	var arr = $"../../AtkCheck/A2r".get_overlapping_bodies()


func _on_animated_sprite_2d_animation_finished() -> void:
	if $"../../AnimatedSprite2D".animation == "攻击1":
		$Timer.start(0.25)
	if $"../../AnimatedSprite2D".animation == "攻击1" || $"../../AnimatedSprite2D".animation == "攻击2":
		get_parent().change_state(0)
