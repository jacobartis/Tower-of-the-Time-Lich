extends Node
class_name StatsComponent

@export var stats:Stats
@export var mod:ModifierComponent

func get_stats():
	if !mod: return stats
	return mod.modify_stats(stats)
