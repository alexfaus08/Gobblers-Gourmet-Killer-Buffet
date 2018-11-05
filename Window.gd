extends Area2D

# Stove.gd uses a very similiar layout. See Stove.gd for documentation.

onready var world = $"../../../World"
onready var popup = $"../../Order"
var player_near_window
var dishes = []
var side_dishes = []
#var diag = AcceptDialog.new()

func _ready():
	player_near_window = false
	world._ready()
	for x in world.get_recipes():
		if(x.get_ingredients()[0] == "Turkey" or x.get_ingredients()[0] == "Chicken" or x.get_ingredients()[0] == "Ham"):
			dishes.append(x)
		else:
			side_dishes.append(x)
	
func _recipes_Main_Course():
	#randomly pick a dish
	var dish_number = randi()%3
	#return the dish
	return dishes[dish_number]

#List ot side dishes	
func _recipes_Sides():
	#randomly pick a side
	var side_dish_number = randi()%5
	#return the side dish
	return side_dishes[side_dish_number]
	

func _process(delta):
	if(player_near_window):
		if(Input.is_action_just_pressed("ui_select")):
			#print(_recipes_Main_Course().get_ingredients()) 
			#print(_recipes_Sides().get_ingredients())
			var main_recipe = _recipes_Main_Course()
			var side_recipe = _recipes_Sides()
			print(main_recipe.get_ingredients().size())
			print(side_recipe.get_ingredients())
			popup.get_label().text =("Main: " + main_recipe.get_ingredients()[0] + "\nSide: "+ side_recipe.get_ingredients()[0])
			popup.show()
			print("\n")

func _on_Window_body_entered(body):
	if (body.get_name() == "Player"):
		player_near_window = true


func _on_Window_body_exited(body):
	if (body.get_name() == "Player"):
		player_near_window = false
