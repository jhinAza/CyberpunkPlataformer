extends Node2D

signal player_detected

func _ready():
	pass
	
func _physics_process(delta):
	if $Body/Ray.collide_with_bodies:
		var body = $Body/Ray.get_collider()
		if body:
			get_tree().call_group("GameEvents", "player_detected")
