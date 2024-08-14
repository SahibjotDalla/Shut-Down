extends CharacterBody2D

@export var speed = 100
@export var accel = 5

signal shoot(position, direction)

func _process(_delta):
	look_at(get_global_mouse_position())
		
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	if Input.is_action_just_pressed("Left Click"):
		shoot.emit($Marker2D.global_position, player_direction)

func _physics_process(_delta):

	var direction: Vector2 = Input.get_vector("A", "D", "W", "S")
	
	velocity.x = move_toward(velocity.x, speed * direction.x, accel)
	velocity.y = move_toward(velocity.y, speed * direction.y, accel)

	move_and_slide()
