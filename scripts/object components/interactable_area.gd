extends Area2D
class_name InteractableArea

signal interacted()
signal highlighted()
signal unhighlighted()

@export var highlight_shader:ShaderMaterial

var highlight: bool = true:
	set(val):
		if val and !highlight:
			highlighted.emit()
		elif !val and highlight:
			unhighlighted.emit()
		highlight = val
		if highlight_shader:
			highlight_shader.set_shader_parameter("enabled",highlight)

func _ready():
	set_collision_layer_value(ProjectInfo.get_collision_layer("Interactable"),true)

func interact():
	interacted.emit()
