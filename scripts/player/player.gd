extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var dash_cooldown:float = .8
var current_dash_cooldown:float = 0
var dash_duration: float = .2
var dash_speed: float = SPEED*5

@onready var dash_timer = $DashTimer

@export var interaction_area:InteractionDetectionArea
@export var weapon_holder:Node2D

func _process(delta):
	current_dash_cooldown = max(0,current_dash_cooldown-delta)
	if !dash_timer.is_stopped():
		return
	if Input.is_action_just_pressed("player_interact"):
		interaction_area.interact()
	if Input.is_action_pressed("player_prim_fire"):
		weapon_holder.attack()
	if Input.is_action_just_pressed("player_alt_fire"):
		weapon_holder.alt_attack()
	if Input.is_action_just_pressed("player_reload"):
		weapon_holder.reload()

func _physics_process(delta):
	if !dash_timer.is_stopped():
		move_and_slide()
		return
	
	var direction = Input.get_vector("player_left","player_right","player_up","player_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	if Input.is_action_just_pressed("player_dash") and current_dash_cooldown==0:
		start_dash()
	move_and_slide()

func start_dash():
	$CollisionShape2D.disabled = true
	$HurtboxComponent/CollisionShape2D.disabled = true
	if velocity.normalized():
		velocity = velocity.normalized()*dash_speed
	else:
		velocity = get_last_motion().normalized()*dash_speed
	dash_timer.start(dash_duration)

func end_dash():
	$CollisionShape2D.disabled = false
	$HurtboxComponent/CollisionShape2D.disabled = false
	current_dash_cooldown = dash_cooldown

