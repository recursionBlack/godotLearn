extends Node

func _init() -> void:
	print("init执行了")
	pass
	
func _enter_tree() -> void:
	print("enter_tree执行了")
	pass
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var src = load("res://node2.gd")
	$Node.set_script(src)
	$Node.a()
	# 将自身从节点中删除
	# 不建议在节点内部调用free()，否则容易报错
	self.queue_free()
	pass # Replace with function body.

func _notification(what: int) -> void:
	if what==1:
		print("我要死了啊")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
