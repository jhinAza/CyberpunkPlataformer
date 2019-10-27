extends Node2D

var coins: int = 0

func _ready():
	self._start_game()

func player_detected():
	print("The player has been detected")
	self._end_game()

func coin_found():
	self.coins = self.coins + 1
	$GUI/CoinsLabel/Value.text = str(self.coins)

func _end_game():
	$GUI/PlayerDetected/State.play("Show")

func _start_game():
	self.coins = 0
	$GUI/PlayerDetected/State.play("Hidden")

func _input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("menu"):
			get_tree().quit()