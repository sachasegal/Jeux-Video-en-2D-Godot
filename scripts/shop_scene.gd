extends Control

const FILE_BEGIN = "res://scenes/level_"
var score = Global.score

@onready var audio_stream_player: AudioStreamPlayer = $"Buttons to buy/buy_speed/AudioStreamPlayer"



func _on_buy_heart_pressed() -> void:
	if GameManager.lives >= 3:
		print("You already have max hearts")
		return
	if GameManager.spend_coins(10):
		GameManager.lives += 1
		$"Buttons to buy/buy_speed/AudioStreamPlayer".play()
		await $"Buttons to buy/buy_speed/AudioStreamPlayer".finished
		get_tree().change_scene_to_file(Global.next_level_path)
	else:
		print("You don't have enough money")
	
	

func _on_buy_speed_pressed() -> void:
	if GameManager.spend_coins(7):
		Global.SPEED +=20
		$"Buttons to buy/buy_speed/AudioStreamPlayer".play()
		await $"Buttons to buy/buy_speed/AudioStreamPlayer".finished
		get_tree().change_scene_to_file(Global.next_level_path)
	else:
		print("You don't have enough money")
	

func _on_buy_strength_pressed() -> void:
	if GameManager.spend_coins(8):
		Global.damage = 2
		$"Buttons to buy/buy_speed/AudioStreamPlayer".play()
		await $"Buttons to buy/buy_speed/AudioStreamPlayer".finished
		get_tree().change_scene_to_file(Global.next_level_path)
	else:
		print("You don't have enough money")
		
	
	




	
	
	
	
func _ready() -> void:
	GameManager.score_label = $CanvasLayer/CoinsLabel
	if GameManager.score_label:
		GameManager.score_label.text = "Coins: " + str(GameManager.score)
	
	






func _on_close_pressed() -> void:
	get_tree().change_scene_to_file(Global.next_level_path)
