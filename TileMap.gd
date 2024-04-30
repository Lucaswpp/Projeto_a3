extends TileMap

var speed = -9.6 * 14
var calc_pos_floor = 2
var time = 0

func _process(delta):
	
	position.x += speed * delta
	
	if position.x < -478:
		position.x = 0
