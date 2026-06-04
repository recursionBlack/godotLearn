extends Base_State

@onready var player:CharacterBody2D = $"../.."

func enter():
	$"../../AnimatedSprite2D".play("Idle")

func do():
	if !player.is_on_floor():
		get_parent().change_state(4)
		return
	var vec:Vector2=Vector2.ZERO
	vec.x = Input.get_axis("ui_left", "ui_right")
	if vec.x!=0:
		get_parent().change_state(1)
		return
	elif Input.is_action_just_released("跳"):
		get_parent().change_state(3)
		return
	elif Input.is_action_just_released("攻击"):
		get_parent().change_state(2)
		return
	player.velocity=Vector2(0,1)
	player.move_and_slide()
