extends StaticBody2D


# Stove.gd uses a very similiar layout. See Stove.gd for documentation.
onready var popup = $"../../FridgeMenu2"
var player_near_fridge
func _ready():
	player_near_fridge = false
	

func _process(delta):
	if(player_near_fridge):
		if(Input.is_action_just_pressed("ui_select")):
			popup.show()

func _on_Area2D_body_entered(body):
	if (body.get_name() == "Player"):
		player_near_fridge = true

func _on_Area2D_body_exited(body):
		if (body.get_name() == "Player"):
			player_near_fridge = false