extends Node
class_name HitHandlerComponent

signal hit_taken()

@export var health_component:HealthComponent

func handle_hit(hit:AttackInfo):
	hit_taken.emit()
	if hit.damage:
		health_component.take_damage(hit.damage)
