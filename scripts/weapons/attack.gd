extends Node
class_name WeaponAttack

@export var projectile: PackedScene = preload("res://scenes/projectiles/player_proj/player_projectile.tscn")
@export var proj_spawn: Node2D
@export var weapon: Weapon

func attack():
	spawn_proj()

func spawn_proj():
	var proj = projectile.instantiate()
	proj.global_transform = proj_spawn.global_transform
	get_tree().get_first_node_in_group("world").add_child(proj)
	proj.velocity = Vector2.RIGHT.rotated(proj.rotation)*weapon.stats.bullet_speed
	weapon.stats.apply_to_proj(proj)
