extends Area2D





func _on_body_entered(body: Node2D) -> void:#cette fonction regarde, si un corps est entré dans un autre corps
	print("+1 coin!")
	queue_free()#ça fait que si le joueurtouche un autre corps, celui.ci disparait
