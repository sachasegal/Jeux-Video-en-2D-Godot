extends Label




func _ready() -> void:
	GameManager.score_label = self
	text = "Coins: " + str(GameManager.score)
