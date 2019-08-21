extends Node2D

var coins: int = 0

func player_detected():
	print("The player has been detected")

func coin_found():
	self.coins = self.coins + 1
	print("Tenemos %s monedas" % self.coins)
