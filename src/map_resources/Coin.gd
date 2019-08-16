extends Node2D

signal player_entered

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	emit_signal("player_entered")
	get_tree().call_group("Player", "coin_found")
	get_tree().queue_delete(self)
