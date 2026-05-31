extends CharacterBody2D

const speed = 20


@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var player = get_tree().get_first_node_in_group("Payer")

func _physics_process(delta: float) -> void:
	var direction = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = direction * speed
	move_and_slide()
	
func makepath() -> void:
	nav_agent.target_position = player.global_position
		


func _on_timer_timeout() -> void:
	makepath()
	
	
