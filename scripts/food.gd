extends Area2D

func _ready():
	pass

func _on_food_area_entered(area):
	queue_free()
