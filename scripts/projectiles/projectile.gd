extends CharacterBody2D

func _physics_process(delta):
	move_and_slide()


func _on_hit_box_component_hurtbox_hit(box):
	queue_free()
