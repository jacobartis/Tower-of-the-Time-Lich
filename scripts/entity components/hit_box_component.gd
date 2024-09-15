extends Area2D
class_name HitBoxComponent

signal hurtbox_hit(box:HurtBoxComponent)

@export var hit_players:bool = true
@export var hit_enemies:bool = false

func _ready():
	set_collision_layer_value(1,false)
	set_collision_mask_value(1,false)
	area_entered.connect(hurtbox_overlap)
	set_collision_mask_value(ProjectInfo.get_collision_layer("Player"),hit_players)
	set_collision_mask_value(ProjectInfo.get_collision_layer("Enemy"),hit_enemies)

func hurtbox_overlap(area:Area2D):
	if !area is HurtBoxComponent: return
	hurtbox_hit.emit(area)
