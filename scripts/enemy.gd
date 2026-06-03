extends CharacterBody2D



var speed = 35
var player_chase = false
var player = null

func _physics_process(delta: float) -> void:
	if player_chase:
		position.x += (player.position.x - position.x)/speed 
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		
		$AnimatedSprite2D.play("walk")
		
		
	
	else:
		$AnimatedSprite2D.play("idle")
		
		move_and_collide(Vector2(0,0))
	



func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true
	

	
	
	
	
	
	


func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false


		



	
