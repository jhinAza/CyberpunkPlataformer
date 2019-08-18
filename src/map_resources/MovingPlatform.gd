extends Node2D

const IDLE_DURATION = 1.0

export var move_to = Vector2.RIGHT * 192
export var speed = 4

var follow = Vector2.ZERO

func _ready():
	self._ready_tween()
	
func _ready_tween():
	var duration = self.move_to.length() / float(self.speed * 64)
	$Tween.interpolate_property(self, "follow", Vector2.ZERO, self.move_to, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, self.IDLE_DURATION)
	$Tween.interpolate_property(self, "follow", self.move_to, Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + self.IDLE_DURATION)
	$Tween.start()

func _physics_process(delta):
	$Platform.position = $Platform.position.linear_interpolate(self.follow, 0.075)
