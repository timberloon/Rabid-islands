extends NodeState

@export var player:CharacterBody2D
@export var animation:AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if player.last_direction == Vector2.UP:
		animation.play("idle_up")
	elif player.last_direction == Vector2.DOWN:
		animation.play("idle_down")
	elif player.last_direction == Vector2.LEFT:
		animation.play("idle_left")
	elif player.last_direction == Vector2.RIGHT:
		animation.play("idle_right")
	else:
		animation.play("idle_down")


func _on_next_transitions() -> void:
	input_event.movement_input()
	if input_event.is_movement_input():
		transition.emit("walk")
	if Input.is_action_just_pressed("action"):
		transition.emit("chopping")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animation.stop()
