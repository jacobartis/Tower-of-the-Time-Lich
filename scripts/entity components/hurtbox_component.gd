extends Area2D
class_name HurtBoxComponent

signal hit(hit_info:AttackInfo)

@export var player_hitbox:bool = false
@export var enemy_hitbox:bool = true

func _ready():
	set_collision_layer_value(ProjectInfo.get_collision_layer("Player"),player_hitbox)
	set_collision_layer_value(ProjectInfo.get_collision_layer("Enemy"),enemy_hitbox)

func register_attack(info:AttackInfo):
	hit.emit(info)
