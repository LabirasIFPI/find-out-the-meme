extends Node

#@onready var timer = $time_node
@onready var time = 0
@onready var timeOn = false
@export var secs = 0
@onready var label_text = $Label3D.text
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timeOn: 
		time += delta
	
	secs = fmod(time, 60)
	
	#label_text = f(secs + "s")
	
	

func start_time():
	timeOn = true
	
func stop_time():
	timeOn = false
	secs = 0
	time = 0

func stop_in_time(when: int):
	if (timeOn):
		if secs == when:
			emit_signal("time_is_over")
			stop_time()
		#emitir um sinal quando chegar ao tempo designado
		pass
