extends Node2D

var item = preload("res://items/log.tres")

func _on_collect_zone_body_entered(body: Node2D) -> void:
	if body.name == "player":
		Manager.add_to_player_inventory(item)
		queue_free()
