class_name Player
extends CharacterBody2D

@export var health=100

func _ready() -> void:
	self.add_to_group("player")
	$CanvasLayer/TextureProgressBar.max_value=health
	
func take_hit(value:int) -> void:
	health=health-value
	$CanvasLayer/TextureProgressBar.value = health
	$FSM.change_state(5)
