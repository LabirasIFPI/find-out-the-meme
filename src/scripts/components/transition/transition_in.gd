extends CanvasLayer

var tween : Tween
@onready var overlay : ColorRect = $Overlay

func _ready():
	visible = true
	tween = create_tween()
	tween.tween_property(overlay, "progress", 0.0, 2.0).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN_OUT)
	tween.play()
	await tween.finished
	visible = false
