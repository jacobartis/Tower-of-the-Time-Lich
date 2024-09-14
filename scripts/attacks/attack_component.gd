extends Node
class_name AttackComponent

@export var info: AttackInfo

func apply_hit(box:HurtBoxComponent):
	box.register_attack(info)
