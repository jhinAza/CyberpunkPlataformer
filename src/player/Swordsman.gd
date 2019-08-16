extends KinematicBody2D

export var base_speed: int

export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false
var coins = 0
var facing: int = 1

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')
	
	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
	
func _process_animation():
	if self.is_on_floor():
		if velocity.x:
			$AnimationPlayer.play('Walk')
		else:
			$AnimationPlayer.play('Idle')

	if jumping:
		$AnimationPlayer.play('Jump')
	
func _set_facing():
	#print(self.scale.x)
	#print(self.velocity.x)
	print(self.facing)
	if velocity.x > 0 and self.facing == -1:
		print("Turn right")
		#self.apply_scale(Vector2(-1, 1))
		self._turn()
		self.facing = 1
	elif velocity.x < 0 and self.facing == 1:
		print("turn left")
		#self.apply_scale(Vector2(-1, 1))
		self._turn()
		self.facing = -1

func _turn():
	$Torso.scale.x = -$Torso.scale.x

func coin_found():
	self.coins = self.coins + 1
	print("Tenemos %s monedas" % self.coins)

func _physics_process(delta):
	get_input()
	self._process_animation()
	
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
	self._set_facing()

