extends Node2D
signal start()

@export var timer_length: float = 60

var started: bool = false

func start_room():
	if started: return
	started = true
	get_tree().get_first_node_in_group("TimerDisplay").start_timer(timer_length)
	start.emit()
