extends Area2D

# export allows for editing in the GoDot editor 
export (int) var speed = 100 # How fast the player will move (pixels/sec).
var screensize  # Size of the game window.

func _ready():
	screensize = get_viewport_rect().size
	
	
func _process(delta):
	var velocity = Vector2() # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	# Clamping a value means restricting it to a given range.
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)

	
