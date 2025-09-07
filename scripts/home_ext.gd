extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		Manager.last_pos = body.position
		Manager.scene_changed = true
		call_deferred("_change_scene")

func _change_scene() -> void:
	Transition.change_scene("res://scenes/house_interior.tscn")
