extends Node2D


func _ready() -> void:
	GameManager.hearts = [$GameManager/CanvasLayer/Hearts/HBoxContainer/Heart, $GameManager/CanvasLayer/Hearts/HBoxContainer/Heart2, $GameManager/CanvasLayer/Hearts/HBoxContainer/Heart3]
	for h in 3:
		if h < GameManager.lives:
			GameManager.hearts[h].show()
		else:
			GameManager.hearts[h].hide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
