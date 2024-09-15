extends Node

var collision_layers: Dictionary = {
	"Wall":1,
	"Player":2,
	"Enemy":3,
}

func get_collision_layer(l_name:String):
	if !collision_layers.has(l_name): return null
	return collision_layers[l_name]
