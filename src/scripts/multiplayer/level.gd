# level.gd
extends Node3D

const SPAWN_RANDOM := 2.0

func _ready():
	# We only need to spawn players on the server.
	#update_tile()
	if not multiplayer.is_server():
		return

	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(del_player)

	# Spawn already connected players.
	for id in multiplayer.get_peers():
		add_player(id)

	# Spawn the local player unless this is a dedicated server export.
	if not OS.has_feature("dedicated_server"):
		add_player(1)
		config_tile()


func _exit_tree():
	if not multiplayer.is_server():
		return
	multiplayer.peer_connected.disconnect(add_player)
	multiplayer.peer_disconnected.disconnect(del_player)


func add_player(id: int):
	#var skin: String = $"/root/ConfigsPlayer".skin_selected
	var character = preload("res://src/scenes/players/player.tscn").instantiate()
	# Set player id.
	character.player_id = id
	# Randomize character position.
	var pos := Vector2.from_angle(randf() * 2 * PI)
	character.position = Vector3(pos.x * SPAWN_RANDOM * randf(), 2, 20)
	character.name = str(id)
	$Players.add_child(character, true)


func del_player(id: int):
	if not $Players.has_node(str(id)):
		return
	$Players.get_node(str(id)).queue_free()

	
func config_tile():
	$"BigScreem".selected_question = $"/root/ConfigsPlayer".level1[$"/root/ConfigsPlayer".level1_correct]
	for i in range(7):
		$"Floor".get_child(i).selectedAnswer = $"/root/ConfigsPlayer".level1[i]
		$"Floor".get_child(i).iniciar()

func update_tile():
	if $"Players/1/PlayerInput":
		$"BigScreem".selected_question = $"Players/1/PlayerInput".level1[$"Players/1/PlayerInput".level1_correct]
		for i in range(7):
			$"Floor".get_child(i).selectedAnswer = $"Players/1/PlayerInput".level1[i]
			$"Floor".get_child(i).iniciar()
