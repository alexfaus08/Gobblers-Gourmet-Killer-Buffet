extends Area2D

var player_near_mixing_station
var mixing
onready var t = get_node("MixingTimer")

func _ready():
	player_near_mixing_station = false
	mixing = false
	$MixSprite.play("Idle")

func _process(delta):
	if(player_near_mixing_station and not mixing):
		if(Input.is_action_just_pressed("ui_select")):
			# the mixing station is now mixing
			mixing = true
			# play the mixing animation
			$MixSprite.play("Mix")
			# wait 10 seconds
			t.set_wait_time(10)
			# start the stove timer
			t.start()
			# wait until the timer completes it's wait time
			yield(t, "timeout")
			# mixing is over, go back to idle
			$MixSprite.play("Idle")
			mixing = false
	


func _on_Mixing_Station_body_entered(body):
	# check to see if that body is the player 
	if(body.get_name() == "Player"):
		player_near_mixing_station = true
	


func _on_Mixing_Station_body_exited(body):
	if(body.get_name() == "Player"):
		player_near_mixing_station = false