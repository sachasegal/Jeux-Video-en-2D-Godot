extends Node



@export var hearts : Array[Node]
@onready var animation_player: AnimationPlayer = $AnimatedSprite2D
var score_label: Label = null

@onready var player = get_node("../Player")
var score = 0
var lives = 3



func decrease_health(body):
	if lives <= 0:
		return
	lives -= 1
	print(lives)
	for h in 3:
		if(h < lives):
			hearts[h].show()
		else:
			hearts[h].hide()
		if lives > 0:
			body.play_hurt()
			
	if lives <= 0:
		lives = 3
		get_tree().reload_current_scene()





func add_point():
	score += 1
	if score_label:
		score_label.text = "Coins: " + str(score)
	
func spend_coins(amount):
	if score >= amount:
		score -= amount
		if score_label:
			score_label.text = "Coins: " + str(score)
		return true
	return false
	
	if score < amount:
		print("You don't have enough coins")
		return false
	else:
		score -= amount
		score_label.text = "Coins: " + str(score)
		return true
	

func attack_ennemy():
	if Input.is_action_just_pressed("attack_ennemy"):
		pass
