extends Node2D

@export var work: bool = false:
	set(val):
		trigger()
@export var clear:bool=false:
	set(val):
		reset()
var rooms: Dictionary = {}
var room_count: int = 5
var wall_length = 16*15
var path: AStar2D

enum Size{
	Small,
	Long,
	Tall,
	Large,
}

var dim: Dictionary = {
	Size.Small:Vector2(wall_length,wall_length),
	Size.Long:Vector2(wall_length*2,wall_length),
	Size.Tall:Vector2(wall_length,wall_length*2),
	Size.Large:Vector2(wall_length*2,wall_length*2),
}

func trigger():
	reset()
	generate_level()

func generate_level():
	for x in room_count:
		add_room(rand_size(),generate_offset())
	await get_tree().create_timer(.1).timeout
	for x in room_count:
		add_room(rand_size(),generate_offset())
	await get_tree().create_timer(.3).timeout
	for x in max(0,$Level.get_child_count()-room_count):
		remove_room($Level.get_children().pick_random())
	await get_tree().create_timer(.2).timeout
	path = generate_points()
	draw_lines()
	$TileMap.generate_map(rooms)

func reset():
	for x in $Level.get_children():
		remove_room(x)

func rand_size():
	return Size.values().pick_random()

func generate_offset():
	return Vector2(randf_range(-10,10),randf_range(-10,10))

func remove_room(room):
	if !rooms.keys().has(room):return
	rooms.erase(room)
	room.queue_free()

func add_room(size:Size, offset:Vector2):
	var body = RigidBody2D.new()
	var box = create_collision_box(size)
	var poly = create_debug_polygon(size)
	poly.position = Vector2.ZERO
	body.lock_rotation = true
	body.gravity_scale = 0
	body.add_child(box)
	body.add_child(poly)
	$Level.add_child(body)
	rooms[body]=dim[size]
	body.global_position = offset

func create_collision_box(size:Size):
	var collision = CollisionShape2D.new()
	collision.shape = create_box(size)
	return collision

func create_debug_polygon(size:Size):
	var polygon = Polygon2D.new()
	var array = []
	array.append(Vector2(-dim[size].x/2,-dim[size].y/2))
	array.append(Vector2(-dim[size].x/2,dim[size].y/2))
	array.append(Vector2(dim[size].x/2,dim[size].y/2))
	array.append(Vector2(dim[size].x/2,-dim[size].y/2))
	polygon.polygon = PackedVector2Array(array)
	return polygon

func create_box(size:Size):
	var box = RectangleShape2D.new()
	box.size = dim[size]
	return box

func draw_lines():
	for x in $Lines.get_children():
		x.queue_free()
	if path:
		for p in path.get_point_ids():
			for c in path.get_point_connections(p):
				var pp = path.get_point_position(p)
				var cp = path.get_point_position(c)
				$Lines.add_child(generate_line(pp,cp,Color(1,1,0)))


func generate_line(to:Vector2,from:Vector2,color:Color):
	var line = Line2D.new()
	line.add_point(to)
	line.add_point(from)
	line.default_color = Color(1,1,0)
	return line

func generate_points():
	var path = AStar2D.new()
	var points = []
	for x in $Level.get_children():
		points.append(x.global_position)
	path.add_point(path.get_available_point_id(),points.pop_front())
	while points:
		var min_dist = INF
		var min_p = null
		var p = null
		for p1id in path.get_point_ids():
			var p1 = path.get_point_position(p1id)
			for p2 in points:
				if p1.distance_to(p2) <min_dist:
					min_dist = p1.distance_to(p2)
					min_p = p2
					p = p1
		var n = path.get_available_point_id()
		path.add_point(n,min_p)
		path.connect_points(path.get_closest_point(p),n)
		points.erase(min_p)
	return path
