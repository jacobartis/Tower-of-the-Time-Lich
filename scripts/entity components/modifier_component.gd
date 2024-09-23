extends Node
class_name ModifierComponent

@export var modifiers: Array[Node] = []

func modify_stats(stats):
	if stats is PlayerStats:
		return mod_player_stats(stats)
	if stats is WeaponStats:
		return mod_weapon_stats(stats)


func mod_player_stats(stats):
	var new_stats = stats.duplicate()
	if modifiers.is_empty(): return new_stats
	var relevent = modifiers.filter(func(x):return x.is_in_group("player_mod"))
	for x in relevent:
		x.apply_to_stats(new_stats)
	#TODO FIND GOOD METHOD FOR THIS!
	return new_stats

func mod_weapon_stats(stats):
	var new_stats = stats.duplicate()
	if modifiers.is_empty(): return new_stats
	var relevent = modifiers.filter(func(x):return x.is_in_group("weapon_mod"))
	for x in relevent:
		x.apply_to_stats(new_stats)
	#TODO FIND GOOD METHOD FOR THIS!
	return new_stats
