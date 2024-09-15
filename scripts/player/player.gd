extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var interaction_area:InteractionDetectionArea

func _process(delta):
	if Input.is_action_just_pressed("player_interact"):
		interaction_area.interact()

func _physics_process(delta):
	
	var direction = Input.get_vector("player_left","player_right","player_up","player_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	move_and_slide()
