extends Node2D
class_name Spawner
signal monster_killed

@export var spawns: Array[PackedScene]

var active:bool = false

func monster_dead():
	print("dead monster")
	active = false
	monster_killed.emit()

func spawn_wave(wave:int):
	if wave<0 or spawns.size()<=wave:
		print("invalid wave ",wave," ",spawns.size())
		return
	if !spawns[wave]: 
		print("No monster this wave")
		return
	spawn_monster(spawns[wave])

func spawn_monster(monster_packed:PackedScene):
	print("spawn monster")
	var monster = monster_packed.instantiate()
	get_tree().get_first_node_in_group("world").call_deferred("add_child",monster)
	monster.global_position = global_position
	active = true
	monster.tree_exiting.connect(monster_dead)
