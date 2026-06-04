extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var direct:Vector2 = Vector2.RIGHT
var attack:bool = false

func _ready():
	# 强制物理引擎更新，确保射线状态正确
	await get_tree().physics_frame
	$RightDownCast.force_raycast_update()  # 强制立即检测
	# 初始播放待机动画
	$AnimatedSprite2D.play("移动")

func _physics_process(delta: float) -> void:
	# 边缘检测：只有前方是悬崖时才转身
	if !$RightDownCast.is_colliding():
		direct = Vector2.LEFT
		$AnimatedSprite2D.flip_h = true
	elif !$LeftDownCast.is_colliding():
		direct = Vector2.RIGHT
		$AnimatedSprite2D.flip_h = false
	velocity.x = direct.x * SPEED
	velocity.y += get_gravity().y * delta
	move_and_slide()
