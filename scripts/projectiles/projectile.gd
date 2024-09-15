extends CharacterBody2D
class_name Projectile

@export var attack_component:AttackComponent

func _physics_process(delta):
	move_and_slide()

func _on_hit_box_component_hurtbox_hit(box):
	queue_free()
