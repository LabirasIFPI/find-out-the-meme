extends Spatial
class_name PlayerAnimator

onready var animation: AnimationPlayer = get_node("AnimationPlayer")

var on_action: bool = false

export(NodePath) onready var player = get_node(player) as KinematicBody

func animate(velocity: Vector2) -> void:
	if on_action:
		return
	
	move_behavior(velocity)
	

func move_behavior(velocity: Vector2) -> void:
	if velocity != Vector2.ZERO:
		animation.play("Running_A")
		return
	
	animation.play("Idle")

func action_behavior(action: String) -> void:
	on_action = true
	animation.play(action)

func _on_animation_finished(anim_name: String) -> void:
	var action_condition: bool = (
		anim_name == "Jump_Land"
	)
	
	if anim_name == "Jump_Full_Short":
		animation.play("Jump_Idle")
	
	if action_condition:
		on_action = false
		player.set_physics_process(true)
	
