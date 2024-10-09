extends Node2D

@onready var weapon:Weapon = $Weapon :set=set_weapon
@export var mod_comp: ModifierComponent

func set_weapon(new):
	if weapon != new:
		weapon.queue_free()
	weapon = new
	add_child(weapon)
	weapon.mod_comp = mod_comp

func _process(delta):
	look_at(get_global_mouse_position())

func attack():
	weapon.attack()

func alt_attack():
	weapon.alt_attack()

func reload():
	weapon.reload()
