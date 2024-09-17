extends TileMap


func generate_map(rooms:Dictionary):
	for room in rooms:
		set_cell(0,local_to_map(room.global_position),0,Vector2i.ZERO)
		print(local_to_map(room.global_position))
