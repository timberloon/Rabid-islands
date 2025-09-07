extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		call_deferred("change_scene")
		
func change_scene()->void:
	Transition.change_scene("res://scenes/test/y_sort.tscn")
