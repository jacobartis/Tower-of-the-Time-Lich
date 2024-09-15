extends Resource
class_name WeaponStats

@export var bullet_speed: float = 200
@export var fire_rate: float = 2
@export var damage: float = 10
@export var ammo:float = 5
@export var reload_time:float = 3

func apply_to_proj(proj:Projectile):
	if !proj: return
	if !proj.attack_component: return
	proj.attack_component.info = to_attack_info()

func to_attack_info():
	var info = AttackInfo.new()
	info.damage = damage
	print(damage)
	return info
