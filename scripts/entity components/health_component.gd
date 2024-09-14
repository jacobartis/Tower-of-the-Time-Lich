extends Node
class_name HealthComponent

signal health_update(val)
signal dead()

@export var max_health:float = 100
var health:float = 0:
	set(val):
		health = clamp(val,0,max_health)
		print(health)

func _ready():
	health = max_health

func take_damage(val:float):
	health -= val
