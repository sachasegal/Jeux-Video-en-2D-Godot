extends Area2D



@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:#cette fonction regarde, si un corps est entré dans un autre corps
	GameManager.add_point()
	animation_player.play("pickup")
	
