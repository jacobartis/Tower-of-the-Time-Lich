extends Node2D
class_name Weapon

signal wrong_action()

@export var stats: WeaponStats
@export var prim_fire: WeaponAttack
@export var alt_fire: WeaponAttack
@export var prim_cooldown:Timer
@export var ammo_component:AmmoComponent

func _ready():
	ammo_component.max_ammo = stats.ammo
	ammo_component.fill_ammo()
	ammo_component.reload_duration = stats.reload_time

func attack():
	if prim_cooldown.is_stopped() and ammo_component.has_ammo():
		prim_fire.attack()
		prim_cooldown.start(1.0/stats.fire_rate)
		ammo_component.ammo -= 1
	if !ammo_component.has_ammo():
		reload()

func alt_attack():
	if !alt_fire: 
		wrong_action.emit()
		return
	alt_fire.attack()

func reload():
	ammo_component.reload()
