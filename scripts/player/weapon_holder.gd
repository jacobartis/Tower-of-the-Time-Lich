extends Node2D

const PLAYER_PROJECTILE = preload("res://scenes/projectiles/player_projectile.tscn")

@onready var weapon:Weapon = $Weapon

func _process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("player_prim_fire"):
		weapon.attack()
	if Input.is_action_just_pressed("player_alt_fire"):
		weapon.alt_attack()

