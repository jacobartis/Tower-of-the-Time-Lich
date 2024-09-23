extends Node
class_name AttackStatsComponent

@export var stats:AttackStats
@export var mod:ModifierComponent

func _ready():
	print("brother")

func get_stats():
	return mod.modify_stats(stats)
