extends Control


func _on_next_level_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	
	


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_options_pressed() -> void:
	pass # Replace with function body.
