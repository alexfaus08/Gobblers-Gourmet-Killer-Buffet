extends Node2D

var recipes = []

class Recipe:
	var r_name
	var ingredients = []
	var cook_time = 0.0
	var appliance
	var poisoned
	
	func _init(p_name, p_ingredients, p_cook_time, p_appliance):
		r_name = p_name
		for x in p_ingredients:
			ingredients.append(x)
		ingredients.sort()
		cook_time = p_cook_time
		appliance = p_appliance
		poisoned = false
		
	func get_ingredients():
		return ingredients
		
	func get_cook_time():
		return cook_time
	
	func get_appliance():
		return appliance
	
	func get_name():
		return r_name
		

func _ready():
	# initialize all recipes here
	var Turkey = Recipe.new("Turkey", ["Turkey"], 20, "Oven")
	recipes.append(Turkey)
	var Chicken = Recipe.new("Chicken", ["Chicken"], 20, "Oven")
	recipes.append(Chicken)
	var Ham = Recipe.new("Ham", ["Ham"], 20, "Oven")
	recipes.append(Ham)
	var Mashed_Potatoes = Recipe.new("Mashed Potatoes", ["Potatoes", "Butter", "Milk"], 10, "Stove")
	recipes.append(Mashed_Potatoes)
	var Green_Beans = Recipe.new("Green Beans", ["Green Beans", "Butter"], 10, "Stove")
	recipes.append(Green_Beans) 
	var Cranberry_Sauce = Recipe.new("Cranberry Sauce", ["Cranberries"], 8, "Stove")
	recipes.append(Cranberry_Sauce)
	var Creamed_Corn = Recipe.new("Creamed Corn", ["Corn", "Milk", "Cheese"], 10, "Oven")
	recipes.append(Creamed_Corn)
	var Stuffing= Recipe.new("Stuffing", ["Bread", "Celery", "Broth", "Butter", "Apples", "Onions"], 5, "Oven")
	recipes.append(Stuffing)
	
	
	
func get_recipes():
	return recipes

func recipe_lookup(arr):
	arr.sort()
	for r in recipes:
		if (r.get_ingredients() == arr):
			return r
