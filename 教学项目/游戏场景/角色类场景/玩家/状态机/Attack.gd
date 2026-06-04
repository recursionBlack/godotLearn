extends Base_State

var attack_index: int = 0

@onready var ani_sprite2d:AnimatedSprite2D=$"../../AnimatedSprite2D"

func enter():
	$Timer.stop()
	if attack_index==0:
		$"../../AnimationPlayer".play("攻击1")
	elif attack_index==1:
		$"../../AnimationPlayer".play("攻击2")
	else:
		$"../../AnimationPlayer".play("攻击3")
	
	
func do():
	pass
	
func exit():
	ani_sprite2d.frame = 0
	$AnimationPlayer.stop()
	
func _on_timer_timeout() -> void:
	attack_index = 0
	

func attack_check():
	var arr = []
	if attack_index == 0:
		arr=$"../../Attack_Check/A1".get_overlapping_bodies()
	if attack_index == 1:
		arr=$"../../Attack_Check/A2".get_overlapping_bodies()
	if attack_index == 2:
		arr=$"../../Attack_Check/A2".get_overlapping_bodies()
	for i in arr:
		if i.is_in_group("monster"):
			i.take_hit(10)


func _on_animated_sprite_2d_animation_finished() -> void:
	if ani_sprite2d.animation.left(6)=="Attack":
		attack_index+=1
		if attack_index==3:
			attack_index = 0
		$Timer.start(0.25)
		get_parent().change_state(0)
		
