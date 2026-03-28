extends CharacterBody2D

@export var speed = 400 #ça c'est la vitesse à laquelle on est entrain de bouger

func get_input(): #C'est une function qui va réagir quand on apuis une touche
	var input_direction = Input.get_vector("move_left", "move_right") #Cette ligne lit si le joueur appuie à gauche ou à droite.
	velocity
