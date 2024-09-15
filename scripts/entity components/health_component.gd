extends Node
class_name HealthComponent

signal health_update(val)
signal change()
signal dead()

@export var max_health:float = 100:
	set(val):
		max_health = val
		change.emit()
var health:float = 0:
	set(val):
		health = clamp(val,0,max_health)
		health_update.emit(health)
		print(health)
		if health == 0:
			dead.emit()

func _ready():
	health = max_health

func take_damage(val:float):
	health -= val
