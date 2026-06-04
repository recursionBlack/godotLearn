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
	if direct == Vector2.RIGHT && attack == false:
		if $RightAtkCheck.is_colliding():
			$AnimatedSprite2D.play("攻击")
			attack = true
	if direct == Vector2.LEFT && attack == false:
		if $LeftAtkCheck.is_colliding():
			$AnimatedSprite2D.play("攻击")
			attack = true
	if attack:
		return
	velocity.x = direct.x * SPEED
	velocity.y += get_gravity().y * delta
	move_and_slide()


func _on_animated_sprite_2d_frame_changed() -> void:
	if $AnimatedSprite2D.animation == "攻击":
		if $AnimatedSprite2D.frame == 8:
			var sce = preload("res://游戏场景/角色类场景/远程弓箭手/弓箭/弓箭.tscn")
			var arrow_instance = sce.instantiate()  # 创建实例
			if direct == Vector2.RIGHT:
				arrow_instance.position = $RAtk.global_position  # 现在可以设置位置了
			else:
				arrow_instance.position = $LAtk.global_position
			arrow_instance.vec_x = direct.x
			get_parent().add_child(arrow_instance)  # 添加到场景树中
				


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "攻击":
		attack = false
