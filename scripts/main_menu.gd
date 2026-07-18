extends Control





func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_0.tscn")



func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_options_pressed() -> void:
	print("options pressed")
	get_tree().change_scene_to_file("res://scenes/shop_scene.tscn")
