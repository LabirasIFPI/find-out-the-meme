extends ColorRect


@export var progress: float = 1.0

# warning-ignore:unused_argument
func _process(delta):
	material.set("shader_param/progress", progress)
