extends Node
class_name HealthComponent

signal health_update(val)
signal dead()

@export var stats_comp:StatsComponent

var health:float = 0:
	set(val):
		health = clamp(val,0,stats_comp.get_stats().max_health)
		health_update.emit(health)
		if health == 0:
			dead.emit()

func get_max_health():
	return stats_comp.get_stats().max_health

func _ready():
	health = stats_comp.get_stats().max_health
	print(stats_comp.get_stats().max_health)

func take_damage(val:float):
	health -= val
