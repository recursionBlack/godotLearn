extends Base_State

@onready var ani_sprite2d:AnimatedSprite2D=$"../../AnimatedSprite2D"
@onready var player:CharacterBody2D=$"../.."

var SPEED = 200
var jump_speed = -200
var jumping:bool = false

func enter():
	ani_sprite2d.play("Prejump")
	await ani_sprite2d.animation_finished
	if ani_sprite2d.animation=="Prejump":
		ani_sprite2d.play("Jump")
		jumping=true
		player.velocity.y=jump_speed

func do():
	if jumping:
		if player.velocity.y>0:
			get_parent().change_state(4)
			return
		var vec:Vector2=Vector2.ZERO
		vec.x=Input.get_axis("ui_left","ui_right")
		player.velocity.x=vec.x*SPEED
		player.velocity.y=player.velocity.y+2
		player.move_and_slide()

func exit():
	player.velocity.y=0
	jumping=false
