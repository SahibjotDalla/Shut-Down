extends CharacterBody2D

@export var speed = 80
@export var accel = 5

@onready var player = get_parent().get_node("Player")

func _process(_delta):
	$NavigationAgent2D.target_position = player.global_position
	look_at(player.global_position)

func _physics_process(_delta):
	
	#var direction = (player.global_position - global_position).normalized()
	
	var next_path_pos = $NavigationAgent2D.get_next_path_position()
	var direction = (next_path_pos - global_position).normalized( )

	velocity.x = move_toward(velocity.x, speed * direction.x, accel)
	velocity.y = move_toward(velocity.y, speed * direction.y, accel)

	move_and_slide()
