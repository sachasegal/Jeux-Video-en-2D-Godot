extends Control

const FILE_BEGIN = "res://scenes/level_"



func _on_buy_heart_pressed() -> void:
	Global.lives += 1
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
		
	var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
	get_tree().change_scene_to_file(next_level_path)
	
	

func _on_buy_speed_pressed() -> void:
	Global.SPEED += 20
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
		
	var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
	get_tree().change_scene_to_file(next_level_path)

func _on_buy_strength_pressed() -> void:
	pass
	



func _on_minus_speed_pressed() -> void:
	Global.SPEED -= 20
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
		
	var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
	get_tree().change_scene_to_file(next_level_path)
	
