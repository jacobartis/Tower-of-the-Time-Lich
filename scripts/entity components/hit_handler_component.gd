extends Node
class_name HitHandlerComponent

@export var health_component:HealthComponent

func handle_hit(hit:AttackInfo):
	print("Hit")
	if hit.damage:
		health_component.take_damage(hit.damage)
