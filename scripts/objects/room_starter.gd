extends Node2D
signal start()

@export var timer_length: float = 60

func start_room():
	get_tree().get_first_node_in_group("TimerDisplay").start_timer(timer_length)
	start.emit()
