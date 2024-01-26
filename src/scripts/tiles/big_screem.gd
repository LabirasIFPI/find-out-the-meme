extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var questions = QuestionsDatabase.questionsDatabase
	var position: int = (randi() % len(questions))
	
	var selected_question = questions[position]
	var node_csgBox3d : CSGBox3D = $CSGBox3D
	var texture = load(selected_question.image_src)
	
	var mat: StandardMaterial3D = node_csgBox3d.material
	
	if !mat:
		mat = StandardMaterial3D.new()
		node_csgBox3d.material = mat
	
	mat.albedo_texture = texture
	#print(selected_question)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
