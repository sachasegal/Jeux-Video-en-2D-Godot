extends CharacterBody2D

@onready var grapplecontroller := $GrappleController

const ACCELERATION = 0.1
const DECELERATION = 0.1
var can_attack: bool = true
var attack_cooldown: float = 0.4
var SPEED = Global.SPEED
const JUMP_VELOCITY = -300.0
var is_hurt = false


func play_hurt() -> void:
	is_hurt = true
	animated_sprite.play("hurt")
	await animated_sprite.animation_finished
	is_hurt = false


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@onready var timer: Timer = $Timer
	
	
func _physics_process(delta: float) -> void:


	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or grapplecontroller.launched):
		velocity.y += JUMP_VELOCITY
		grapplecontroller.retract()

	#Get the input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	#Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
		# Play animations
		
		if not is_hurt:
			if is_on_floor():
				if direction == 0:
					animated_sprite.play("idle")
				else:
					animated_sprite.play("run")
		
	
	if direction:
		velocity.x = lerp(velocity.x, SPEED * direction, ACCELERATION)
	else:
		velocity.x = lerp(velocity.x, 0.0, DECELERATION)

	move_and_slide()
	



func _input(event):
	if event.is_action_pressed("attack_ennemy"):
		$AnimatedSprite2D.play("attack")
		timer.start()

		


func _on_timer_timeout() -> void:
	$AnimatedSprite2D.play("Idle")
	
	



	
	
	
	
