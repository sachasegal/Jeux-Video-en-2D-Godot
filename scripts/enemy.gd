extends CharacterBody2D

@onready var game_manager = %GameManager

var speed = 35
var player_chase = false
var player = null

func _physics_process(delta: float) -> void:
	if player_chase:
		position.x += (player.position.x - position.x)/speed 
		
		$AnimatedSprite2D.play("walk")
		
		if (player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
			
		else:
			$AnimatedSprite2D.flip_h = false
	
	else:
		$AnimatedSprite2D.play("idle")
		
		

func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true
	
	
func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false


func _on_hurt_area_body_entered(body: Node2D) -> void:
	
	
	#game_manager.decrease_health()
	#print("collision")
	
	pass
	
