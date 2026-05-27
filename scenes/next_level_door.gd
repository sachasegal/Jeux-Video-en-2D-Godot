extends Area2D


var entered = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		entered = true


func _on_body_exited(body: Node2D) -> void:
	entered = false
	
	
func _physics_process(delta: float) -> void:
	if entered == true:
		if Input.is_action_just_pressed("new_scene"):
			get_tree().change_scene("res://scenes/level_1.tscn")
