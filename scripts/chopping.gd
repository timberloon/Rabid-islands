extends NodeState

@export var player:CharacterBody2D
@export var animation:AnimatedSprite2D


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if Input.is_action_just_released("action"):
		transition.emit("idle")


func _on_enter() -> void:
	if Manager.last_direction == Vector2.DOWN:
		animation.play("chopping_down")
	elif Manager.last_direction == Vector2.RIGHT:
		animation.play("chopping_right")
	elif Manager.last_direction == Vector2.LEFT:
		animation.play("chopping_left")
	player.chopping = true


func _on_exit() -> void:
	player.chopping = false
	animation.stop()
