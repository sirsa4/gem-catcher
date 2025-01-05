extends Control

@onready var gameover_sound: AudioStreamPlayer2D = $GameoverSound
@onready var score_label: Label = $ScoreLabel

func _ready() -> void:
	score_label.text = "Score: %d" % Global.score
	gameover_sound.play()

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
