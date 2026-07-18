extends Node



@export var hearts : Array[Node]
@onready var animation_player: AnimationPlayer = $AnimatedSprite2D
@onready var player = %Player


var score = 0
var lives = 3

func decrease_health():
	lives -= 1
	print(lives)
	for h in 3:
		if(h < lives):
			hearts[h].show()
		else:
			hearts[h].hide()
		
			
	if(lives == 0):
		get_tree().reload_current_scene()



@onready var score_label: Label = $CanvasLayer/ScoreLabel

func add_point():
	score += 1
	score_label.text = "Coins: " + str(score) 
	
func spend_coins(amount):
	if score >= amount:
		score -= amount
		score_label.text = "Coins: " + str(score)
		return true
	return false
	

func attack_ennemy():
	if Input.is_action_just_pressed("attack_ennemy"):
		pass
		
		

		


		
	
	
