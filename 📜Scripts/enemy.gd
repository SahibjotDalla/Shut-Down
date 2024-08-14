extends CharacterBody2D

@export var speed = 80
@export var accel = 5

@onready var player = get_parent().get_node("Player")

func _process(delta):
	look_at(player.global_position)

func _physics_process(delta):
	
	var direction = (player.global_position - global_position).normalized()

	velocity.x = move_toward(velocity.x, speed * direction.x, accel)
	velocity.y = move_toward(velocity.y, speed * direction.y, accel)

	move_and_slide()
