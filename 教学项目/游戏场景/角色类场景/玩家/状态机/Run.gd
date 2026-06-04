extends Base_State

const SPEED = 400.0
const JUMP_VELOCITY = -400.0

@onready var player:CharacterBody2D=$"../.."
@onready var ani_sprite2d:AnimatedSprite2D=$"../../AnimatedSprite2D"

func enter():
	ani_sprite2d.play("Run")
	
func do():
	if !player.is_on_floor():
		get_parent().change_state(4)
		return
	elif Input.is_action_just_released("跳"):
		get_parent().change_state(3)
		return
	elif Input.is_action_just_released("攻击"):
		get_parent().change_state(2)
		return
	var vec:Vector2=Vector2.ZERO
	vec.x=Input.get_axis("ui_left","ui_right")
	if vec.x==0:
		get_parent().change_state(0)
		return
	elif vec.x>0:
		ani_sprite2d.flip_h = false
	else:
		ani_sprite2d.flip_h = true
	player.velocity.x=vec.x*SPEED
	player.velocity.y=1
	player.move_and_slide()
	
	
