extends Base_State

@onready var ani:AnimationPlayer = $"../../AnimationPlayer"
@onready var monster:CharacterBody2D = $"../.."
@onready var a1:Area2D = $"../../AtkCheck/A1"


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var direct:Vector2 = Vector2.RIGHT
var attack:bool = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func enter():
	ani.play("走动")
	
func do():
	# 边缘检测：只有前方是悬崖时才转身
	if !$"../../RightDownCast".is_colliding():
		direct = Vector2.LEFT
		$"../../AtkCheck".scale.x=-1
		$"../../AnimatedSprite2D".flip_h = true
	elif !$"../../LeftDownCast".is_colliding():
		direct = Vector2.RIGHT
		$"../../AtkCheck".scale.x=1
		$"../../AnimatedSprite2D".flip_h = false
	var arr:Array = a1.get_overlapping_bodies()
	if arr.size() > 0:
		get_parent().change_state(1)
		return
	monster.velocity.x=direct.x*SPEED
	monster.velocity.y += gravity
	monster.move_and_slide()
	
	
