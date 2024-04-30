extends Sprite

const speed = -0.5 * 9.6
func _process(delta):

	position.x += speed * delta

	if position.x <= -482:
		position.x = 0
