extends Area2D

@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	timer.start()

	
func _on_timer_timeout() -> void:#runs when the timer ends
	GameManager.score = 0
	get_tree().reload_current_scene()
