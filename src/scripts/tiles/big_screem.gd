extends Node3D

@export var selected_question: Dictionary
# Called when the node enters the scene tree for the first time.

func iniciar():
	#var answers = QuestionsDatabase.questionsDatabase
	#
	#var position_answer: int = (randi() % len(answers))
	##var postion: int = (randi() % 50)
	#
	##print("postition")
	##print(len(answers))
	##print(answers[position])
	#
	#selected_question = answers[position_answer]
	var node : CSGBox3D = $"CSGBox3D"
	var texture = load(selected_question.image_src) 
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

