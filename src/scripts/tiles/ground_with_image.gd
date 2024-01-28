extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	var answers = QuestionsDatabase.questionsDatabase
	
	var position: int = (randi() % len(answers))
	
	var selectedAnswer = answers[position]
	
	var meshNode = $hex_forest/MeshInstance3D
	var texture = ImageTexture.new()
	var image = Image.new()
	
	image.load(selectedAnswer.image_src)
	texture.create_from_image(image)
	
	if meshNode.material_override:
		meshNode.material_override.albedo_tex= texture 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
