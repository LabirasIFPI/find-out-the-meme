extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var answers = QuestionsDatabase.questionsDatabase
	
	var position: int = (randi() % len(answers))
	#var postion: int = (randi() % 50)
	
	#print("postition")
	#print(len(answers))
	#print(answers[position])
	
	var selectedAnswer = answers[position]
	var node : CSGBox3D = $hex_forest/CSGBox3D
	var texture = load(selectedAnswer.image_src) 
	var mat : StandardMaterial3D = node.material
	
	if !mat:
		mat = StandardMaterial3D.new()
		node.material = mat
	mat.albedo_texture = texture
	
	#print(node)
	
	


	#if !mat : # in case no material created (in editor / elsewhere)
		#mat = SpatialMaterial.new()
		#boxNode.material = mat
		#mat.albedo_texture = texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
