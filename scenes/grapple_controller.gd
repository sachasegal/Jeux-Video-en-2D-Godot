extends Node2D
@export var rest_length = 2
@export var stiffness = 10
@export var damping = 2

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var player: CharacterBody2D = get_parent()
@onready var rope := $Line2D
var launched = false
var target: Vector2
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ray_cast_2d.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("grapple"):
		launch()
	if Input.is_action_just_released("grapple"):
		retract()
	if launched:
		handle_grapple(delta)
	
		

func launch():
	if ray_cast_2d.is_colliding():
		print("Touché : ", ray_cast_2d.get_collider().name)
		launched = true
		target = ray_cast_2d.get_collision_point()
		rope.show()
		
func retract():
	launched = false
	rope.hide()

func handle_grapple(delta):
	var target_dir = player.global_position.direction_to(target)
	var target_dist = player.global_position.distance_to(target)
	
	var displacement = target_dist - rest_length
	var force = Vector2.ZERO
	
	if displacement > 0:
		var spring_force_magnitude = stiffness * displacement
		var spring_force = target_dir * spring_force_magnitude
		
		var velocity_dot = player.velocity.dot(target_dir)
		var damping = -damping * velocity_dot * target_dir
		
		force = spring_force + damping
	player.velocity += force * delta
	update_rope()

func update_rope():
	rope.set_point_position(1, to_local(target))

func _ready() -> void:
	ray_cast_2d.add_exception(player)
