extends Node2D

@onready var player: CharacterBody2D = $player

func _process(delta: float) -> void:
	if Manager.scene_changed:
		Manager.last_pos += Vector2(0,15)
		player.global_position = Manager.last_pos
		Manager.scene_changed = false
