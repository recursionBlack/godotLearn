extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(AAAA.a)
	AAAA.b()
	print(Input.get_action_strength("向左走"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.get_action_strength("向左走"):
		self.position.x=self.position.x-1
	pass
