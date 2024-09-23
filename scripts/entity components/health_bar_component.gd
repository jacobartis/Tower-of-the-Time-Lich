extends ProgressBar

@export var health_component: HealthComponent

func _ready():
	health_component.health_update.connect(update_health)
	update_values()

func update_health(val):
	value = val
	update_values()

func update_values():
	max_value = health_component.get_max_health()
	value = health_component.health
