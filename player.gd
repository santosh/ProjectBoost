extends RigidBody3D

## Amount of vertical force to apply on rocket.
@export_range(800, 1200) var thurst: float = 1000.0

## Amount of axial boost when turning.
@export var torque_thrust: float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("you are now on launch pad")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * thurst)
		
	if Input.is_action_pressed("rotate_left"):
		apply_torque(Vector3(0.0, 0.0, torque_thrust * delta))

	if Input.is_action_pressed("rotate_right"):
		apply_torque(Vector3(0.0, 0.0, -torque_thrust * delta))

# Called on frame on which rigid body comes in contact with other bodies.
func _on_body_entered(body: Node) -> void:
	if "Hazard" in body.get_groups():
		on_crash()
	elif "Goal" in body.get_groups():
		complete_level()
	elif "Start" in body.get_groups():
		print("you are back on launch pad")

func on_crash() -> void:
	print("you crashed!")
	get_tree().reload_current_scene()

func complete_level() -> void:
	print("you won! you landed on landing pad")
	get_tree().quit()
