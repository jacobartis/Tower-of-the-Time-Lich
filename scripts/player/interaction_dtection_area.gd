extends Area2D
class_name InteractionDetectionArea

var interaction_in_range: Array = []
var active: InteractableArea

func _ready():
	area_entered.connect(add_area)
	area_exited.connect(remove_area)

func _process(delta):
	interaction_in_range.sort_custom(range_sort)
	if interaction_in_range.is_empty() or active == interaction_in_range.front():
		return
	if active:
		active.highlight = false
	active = interaction_in_range.front()
	active.highlight = true

func interact():
	if !active: return
	active.interact()

func add_area(area):
	if !area is InteractableArea or interaction_in_range.has(area):
		return
	interaction_in_range.append(area)

func remove_area(area):
	interaction_in_range.erase(area)
	if active == area:
		active.highlight = false
		active = null

func range_sort(a,b):
	return get_dist(a.global_position)>get_dist(b.global_position)

func get_dist(pos):
	return abs(global_position-pos)
