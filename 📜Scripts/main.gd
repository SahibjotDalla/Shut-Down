extends Node2D

var bullet_scene: PackedScene = preload("res://🎬Scenes/bullet.tscn")

func _on_player_shoot(position, direction):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = position
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + 90
	bullet.direction = direction
	$Bullets.add_child(bullet)
