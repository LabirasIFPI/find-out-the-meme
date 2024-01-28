extends Node3D

var count: int = 1;

func _ready():
	$"Tile1/hex_forest/CSGBox3D".visible = true
	$"Tile2/hex_forest/CSGBox3D".visible = true
	$"Tile3/hex_forest/CSGBox3D".visible = true
	$"Tile4/hex_forest/CSGBox3D".visible = true
	$"Tile5/hex_forest/CSGBox3D".visible = true
	$"Tile6/hex_forest/CSGBox3D".visible = true
	$"Tile7/hex_forest/CSGBox3D".visible = true
	get_parent().get_node("BigScreem/CSGBox3D").visible = false

func _on_timer_timeout():
	if count == 1:
		$"Tile1/hex_forest/CSGBox3D".visible = false
		$"Tile2/hex_forest/CSGBox3D".visible = false
		$"Tile3/hex_forest/CSGBox3D".visible = false
		$"Tile4/hex_forest/CSGBox3D".visible = false
		$"Tile5/hex_forest/CSGBox3D".visible = false
		$"Tile6/hex_forest/CSGBox3D".visible = false
		$"Tile7/hex_forest/CSGBox3D".visible = false
		get_parent().get_node("BigScreem/CSGBox3D").visible = true
		count += 1
	elif count == 2:
		$"Tile1/hex_forest/CSGBox3D".visible = true
		$"Tile2/hex_forest/CSGBox3D".visible = true
		$"Tile3/hex_forest/CSGBox3D".visible = true
		$"Tile4/hex_forest/CSGBox3D".visible = true
		$"Tile5/hex_forest/CSGBox3D".visible = true
		$"Tile6/hex_forest/CSGBox3D".visible = true
		$"Tile7/hex_forest/CSGBox3D".visible = true
		get_parent().get_node("BigScreem/CSGBox3D").visible = true
		#print("-------------------1------------------------")
		#print($"BigScreem".selected_question)
		#print($"Tile1".selectedAnswer)
		#print($"Tile2".selectedAnswer)
		#print($"Tile3".selectedAnswer)
		#print($"Tile4".selectedAnswer)
		if $"Tile1".selectedAnswer != get_parent().get_node("BigScreem").selected_question:
			$"Tile1".queue_free()
		if $"Tile2".selectedAnswer != get_parent().get_node("BigScreem").selected_question:
			$"Tile2".queue_free()
		if $"Tile3".selectedAnswer != get_parent().get_node("BigScreem").selected_question:
			$"Tile3".queue_free()
		if $"Tile4".selectedAnswer != get_parent().get_node("BigScreem").selected_question:
			$"Tile4".queue_free()
		if $"Tile5".selectedAnswer != get_parent().get_node("BigScreem").selected_question:
			$"Tile5".queue_free()
		if $"Tile6".selectedAnswer != get_parent().get_node("BigScreem").selected_question:
			$"Tile6".queue_free()
		if $"Tile7".selectedAnswer != get_parent().get_node("BigScreem").selected_question:
			$"Tile7".queue_free()
		count += 1
		get_parent().get_node("Timer").stop()
