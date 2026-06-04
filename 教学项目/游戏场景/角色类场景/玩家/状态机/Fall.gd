extends Base_State

@onready var ani_sprite2d:AnimatedSprite2D=$"../../AnimatedSprite2D"
@onready var player:CharacterBody2D=$"../.."

var SPEED = 200

func enter():
	ani_sprite2d.play("Fall")
	
func do():
	if player.is_on_floor():
		get_parent().change_state(0)
		return
	var vec:Vector2=Vector2.ZERO
	vec.x = Input.get_axis("ui_left","ui_right")
	player.velocity.x=vec.x*SPEED
	player.velocity.y=player.velocity.y+1
	player.move_and_slide()
