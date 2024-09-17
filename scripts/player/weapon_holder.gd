extends Node2D

const PLAYER_PROJECTILE = preload("res://scenes/projectiles/player_projectile.tscn")

@onready var weapon:Weapon = $Weapon

func _process(delta):
	look_at(get_global_mouse_position())

func attack():
	weapon.attack()

func alt_attack():
	weapon.alt_attack()
