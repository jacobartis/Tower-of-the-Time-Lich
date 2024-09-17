extends Node2D

@onready var weapon:Weapon = $Weapon

func _process(delta):
	look_at(get_global_mouse_position())

func attack():
	weapon.attack()

func alt_attack():
	weapon.alt_attack()

func reload():
	weapon.reload()
