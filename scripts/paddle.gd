extends Area2D

class_name Paddle

@export var SPEED := 400.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		position.x += -SPEED * delta
		#if position.x < get_viewport_rect().size.x:
			#position.x += 10
	if Input.is_action_pressed("move_right"):
		position.x += SPEED * delta
