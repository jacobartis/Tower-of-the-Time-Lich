extends Node2D
class_name Weapon

signal wrong_action()

@export var stats: WeaponStats
@export var prim_fire: WeaponAttack
@export var alt_fire: WeaponAttack

func attack():
	prim_fire.attack()

func alt_attack():
	if !alt_fire: 
		wrong_action.emit()
		return
	alt_fire.attack()
