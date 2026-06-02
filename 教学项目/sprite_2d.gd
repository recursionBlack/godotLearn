extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var s = preload("res://icon.svg")
	var s1 = load("res://icon.svg")
	print(s == s1)
	print(self.texture == s)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
