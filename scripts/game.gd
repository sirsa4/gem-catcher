extends Node2D

@export var gem_scene: PackedScene 
@onready var score: Label = $Score
@onready var timer: Timer = $Timer
@onready var paddle: Paddle = $Paddle
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound




func _ready() -> void:
	
	spawn_gem()

func spawn_gem() -> void:
	print(timer.wait_time)
	if Global.score > 5:
		timer.wait_time = 2
		paddle.SPEED = 450
	if Global.score > 8:
		timer.wait_time = 1.8
		paddle.SPEED = 500
	if Global.score > 10:
		timer.wait_time = 1
		paddle.SPEED = 700
		
	var new_gem: Gem = gem_scene.instantiate()
	new_gem.on_gem_offscreen.connect(game_over)
	var x_pos := randf_range(40,1100)
	new_gem.position = Vector2(x_pos,-50)
	add_child(new_gem)
	
	
func _on_timer_timeout() -> void:
	#print("time out")
	spawn_gem()
	



func _on_paddle_area_entered(area: Area2D) -> void:
	score_sound.position = area.position
	score_sound.play()
	Global.score += 1
	score.text = "%05d" % Global.score
	area.queue_free()
	print(area)
	
func stop_all()-> void:
	timer.stop()
	for child in get_children():
		print(child)
		child.set_process(false)
		
func game_over() -> void:
	stop_all()
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	print("game over")
