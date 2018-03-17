extends Area2D

export (int) var SPEED
var velocity = Vector2()
const FOOD = preload("res://scenes/food.tscn")
var x = 0;
var y = 1;

func _ready():
	
	pass

func _process(delta):
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		rotation_degrees = 180.0
		y = -1
		x = 0
		
	if Input.is_action_pressed("ui_down"):
		rotation_degrees = 0.0
		y = 1
		x = 0
		
	if Input.is_action_pressed("ui_right"):
		rotation_degrees = 270.0
		x = 1
		y = 0
		
	if Input.is_action_pressed("ui_left"):
		rotation_degrees = 90.0
		x = -1
		y = 0
		
	velocity.x = x
	velocity.y = y
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	position += velocity * delta
	
	

func _on_player_area_entered(area):
	if "food" in area.get_name():
#		randomize()
		var food = FOOD.instance()
		var positionOfFood  = Vector2()
		positionOfFood.x = rand_range(10, get_viewport().get_visible_rect().size[0]-10)
		positionOfFood.y = rand_range(10, get_viewport().get_visible_rect().size[1]-10)
		get_parent().add_child(food)
		food.position = positionOfFood
	