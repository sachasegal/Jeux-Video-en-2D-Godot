extends CharacterBody2D

@export var hearts : Array[Node]
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


var is_player_inside = false
var health: int = 3
var speed = 6
var player_chase = false
var player = null
var enemy_live = 3
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var got_hurt = false

func enemy_hurt():
	got_hurt = true
	animated_sprite.play("enemy_hurt")
	await animated_sprite.animation_finished
	got_hurt = false


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
	
	if got_hurt:
		pass
	elif player_chase:
		velocity.x = (player.position.x - position.x) / speed * 10 
		
		$AnimatedSprite2D.play("walk")
		
		if (player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
			
		else:
			$AnimatedSprite2D.flip_h = false
	
	else:
		$AnimatedSprite2D.play("idle")
		velocity.x = 0
	move_and_slide()
		
		

func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true
	
	
func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false


func _on_hurt_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		GameManager.decrease_health(body)
		
		


		

func _on_enemy_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		is_player_inside = true
		
func _input(event: InputEvent) -> void:
	if is_player_inside and event.is_action_pressed("attack_ennemy"):
		
		enemy_live -= 1
		hearts[enemy_live].hide()
		enemy_hurt()
		if enemy_live == 0:
			$AnimatedSprite2D.play("death")
			queue_free()
		
