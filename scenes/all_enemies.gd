extends Node
@export var hearts: Array[Node]

var enemy_live = 3

func decrease_enemy_live():
	enemy_live -=1
	for h in 3:
		if (h < enemy_live):
			hearts[h].show()
		else:
			hearts[h].hide()
	
		
	
