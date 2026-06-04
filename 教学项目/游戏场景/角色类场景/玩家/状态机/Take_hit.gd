extends Base_State

@onready var ani_sprited2d:AnimatedSprite2D=$"../../AnimatedSprite2D"
@onready var player:CharacterBody2D=$"../.."

var SPEED = 200

func enter():
	if player.health>0:
		ani_sprited2d.play("Take_hit")
	else:
		ani_sprited2d.play("Death")
		return
	
func do():
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	if ani_sprited2d.animation == "Take_hit":
		get_parent().change_state(0)
