extends Area2D
class_name HurtBoxComponent

signal hit(hit_info:AttackInfo)

func register_attack(info:AttackInfo):
	hit.emit(info)
