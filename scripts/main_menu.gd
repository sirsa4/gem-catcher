extends Control



func _on_exit_pressed() -> void:
	get_tree().quit()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("game_start"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
