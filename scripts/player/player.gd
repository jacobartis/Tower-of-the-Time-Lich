extends CharacterBody2D

@export var stats_comp:StatsComponent

@onready var dash_timer = $Dash/DashTimer
@onready var dash_cooldown = $Dash/DashCooldown

@export var interaction_area:InteractionDetectionArea
@export var weapon_holder:Node2D


func _ready():
	if !stats_comp.stats is PlayerStats: 
		push_error("Stats not player stats")
		return

func _process(delta):
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
		velocity = direction * stats_comp.get_stats().speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, stats_comp.get_stats().speed)
	if Input.is_action_just_pressed("player_dash") and dash_cooldown.is_stopped():
		start_dash()
	move_and_slide()

func start_dash():
	$CollisionShape2D.disabled = true
	$HurtboxComponent/CollisionShape2D.disabled = true
	var dash_speed = stats_comp.get_stats().speed*stats_comp.get_stats().dash_mod
	if velocity.normalized():
		velocity = velocity.normalized()*dash_speed
	else:
		velocity = get_last_motion().normalized()*dash_speed
	dash_timer.start(stats_comp.get_stats().dash_duration)

func end_dash():
	$CollisionShape2D.disabled = false
	$HurtboxComponent/CollisionShape2D.disabled = false
	dash_cooldown.start(stats_comp.get_statsa().dash_cooldown)
