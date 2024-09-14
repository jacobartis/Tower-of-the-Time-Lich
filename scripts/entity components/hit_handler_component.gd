extends Node
class_name HitHandlerComponent

signal damage(val)
signal new_status(status)

func handle_hit(hit:AttackInfo):
	print("Hit")
	if hit.damage:
		damage.emit(hit.damage)
