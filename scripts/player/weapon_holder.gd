extends Node2D

const PLAYER_PROJECTILE = preload("res://scenes/projectiles/player_projectile.tscn")

func _process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("player_prim_fire"):
		attack()

func attack():
	var inst = PLAYER_PROJECTILE.instantiate()
	inst.global_transform = global_transform
	inst.velocity = Vector2.RIGHT.rotated(inst.rotation)*200
	get_tree().get_first_node_in_group("world").add_child(inst)
