extends Node

var score = 0
var lives = 3

func decrease_health():
	lives -= 1
	print(lives)
	if(lives == 0):
		get_tree().reload_current_scene()

@onready var score_label: Label = $CanvasLayer/ScoreLabel

func add_point():
	score += 1
	score_label.text = "Coins: " + str(score) 
	
	
