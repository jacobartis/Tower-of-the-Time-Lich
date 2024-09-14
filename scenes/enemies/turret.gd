extends StaticBody2D

const PROJECTILE = preload("res://scenes/projectiles/projectile.tscn")

@onready var timer = $Timer

func _process(delta):
	%Turret.look_at(get_tree().get_first_node_in_group("player").global_position)
	if timer.is_stopped():
		attack()

func attack():
	print("bang")
	var inst = PROJECTILE.instantiate()
	inst.global_transform = %ProjSpawn.global_transform
	inst.velocity = Vector2.RIGHT.rotated(inst.rotation)*200
	get_tree().get_first_node_in_group("world").add_child(inst)
	timer.start(.75)
