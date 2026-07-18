extends CharacterBody2D

@export var hearts : Array[Node]
@onready var game_manager = %GameManager

var is_player_inside = false
var health: int = 3
var speed = 35
var player_chase = false
var player = null
var ennemy_live = 3

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
	if body.is_in_group("Player"):
		game_manager.decrease_health()
		


		

func _on_enemy_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		is_player_inside = true
		
func _input(event: InputEvent) -> void:
	if is_player_inside and event.is_action_pressed("attack_ennemy"):
		ennemy_live -= 1
		if ennemy_live == 0:
			$AnimatedSprite2D.play("death")
			queue_free()
			
