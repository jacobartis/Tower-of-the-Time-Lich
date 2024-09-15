extends Node
class_name AmmoComponent

signal ammo_update(new_ammo)
signal reload_start()
signal reload_cancelled()
signal reload_finish()

@export var max_ammo: int = 10
var ammo:int = 0:
	set(val):
		ammo = clamp(val,0,max_ammo)
		ammo_update.emit(ammo)
@export var reload_duration: float = 1
@export var reload_timer: Timer

func has_ammo():
	return ammo>0

func fill_ammo():
	ammo = max_ammo

func _ready():
	reload_timer.one_shot = true
	reload_timer.timeout.connect(finish_reload)

func reload():
	if !reload_timer.is_stopped(): return
	reload_timer.start(reload_duration)
	reload_start.emit()

func cancel_reload():
	reload_timer.stop()
	reload_cancelled.emit()

func finish_reload():
	fill_ammo()
	reload_finish.emit()
