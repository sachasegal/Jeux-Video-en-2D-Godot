extends Control

const FILE_BEGIN = "res://scenes/level_"
var score = Global.score



func _on_buy_heart_pressed() -> void:
	if GameManager.spend_coins(10):
		Global.lives += 1
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
		get_tree().change_scene_to_file(next_level_path)
	
	

func _on_buy_speed_pressed() -> void:
	
	if GameManager.spend_coins(7):
		Global.SPEED +=20
		
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
		get_tree().change_scene_to_file(next_level_path)

func _on_buy_strength_pressed() -> void:
	pass
	




	
	
	
	
func _ready() -> void:
	GameManager.score_label = $CanvasLayer/CoinsLabel
	if GameManager.score_label:
		GameManager.score_label.text = "Coins: " + str(GameManager.score)
	
	


func _on_go_back_pressed() -> void:
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
		
	var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
	get_tree().change_scene_to_file(next_level_path)
