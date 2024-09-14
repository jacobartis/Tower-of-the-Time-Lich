extends Area2D
class_name HitBoxComponent

signal hurtbox_hit(box:HurtBoxComponent)

func _ready():
	area_entered.connect(hurtbox_overlap)

func hurtbox_overlap(area:Area2D):
	if !area is HurtBoxComponent: return
	hurtbox_hit.emit(area)
