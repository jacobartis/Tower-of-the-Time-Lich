extends Area2D
class_name HurtBoxComponent

@export var player_hitbox:bool = false
@export var enemy_hitbox:bool = true

func _ready():
	set_collision_layer_value(ProjectInfo.get_collision_layer("Player"),player_hitbox)
	set_collision_layer_value(ProjectInfo.get_collision_layer("Enemy"),enemy_hitbox)

