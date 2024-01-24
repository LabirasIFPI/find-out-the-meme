extends SpringArm3D
class_name CameraArm

@export var mouse_sensitivity: float = 0.1

func _ready() -> void:
	set_as_top_level(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

func _unhandled_input(event) -> void:
	if not event is InputEventMouseMotion:
		return
	
	rotation_degrees.x -= event.relative.y * mouse_sensitivity
	rotation_degrees.x = clamp(rotation_degrees.x, -90.0, -20.0)
	
	rotation_degrees.y -= event.relative.x * mouse_sensitivity
	rotation_degrees.y = wrapf(rotation_degrees.y, 0.0, 360.0)
	

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_end"):
		get_tree().quit()
