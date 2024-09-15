extends ProgressBar

@export var health_component: HealthComponent

func _ready():
	health_component.health_update.connect(update_health)
	health_component.change.connect(update_values)
	update_values()

func update_health(val):
	value = val

func update_values():
	max_value = health_component.max_health
	value = health_component.health
