extends Control

signal time_up()
signal time_start()

@export var label: RichTextLabel

@export var color: GradientTexture1D

var current_time: float = 0:
	set(val):
		if val == 0 and val != current_time:
			time_up.emit()
		current_time = val
var display_time: float = 0:
	set(val):
		display_time = val
		label.set_text(get_timer_text())

func start_timer(duration):
	current_time = duration
	time_start.emit()

func _process(delta):
	current_time = max(0,current_time-delta)
	display_time = move_toward(display_time,snapped(current_time,.01),100*delta)

func get_timer_text():
	var panic_mult = 1-smoothstep(0,60,display_time)
	set_color(panic_mult)
	return base_formating(to_mins_format(display_time))

func to_mins_format(sec:float):
	var mins = floor(sec/60)
	var secs = sec - mins*60
	if mins:
		return str("%1.0f"%mins,":","%04.1f"%secs)
	else:
		return "%04.1f"%secs

func base_formating(text:String,font_size:float=128):
	return str("[center] [font_size={fs}]"+text).format({"fs":font_size})

func set_color(panic_val):
	label.modulate = color.gradient.sample(panic_val)


func apply_shake(text:String,rate:float=20,level:float=5,connected:float=1):
	return str("[shake rate={r} level={l} connected={c}]"+text).format({"r":round(rate),"l":round(level),"c":round(connected)})
