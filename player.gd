extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("player entered the scene")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		position.y += delta
		
	if Input.is_action_pressed("ui_left"):
		rotate_z(delta)

	if Input.is_action_pressed("ui_right"):
		rotate_z(-delta)
