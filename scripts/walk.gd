#walk.gd
extends NodeState

@export var player:CharacterBody2D
@export var animation:AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	direction = input_event.movement_input()
	
	if direction == Vector2.RIGHT:
		animation.play("walk_right")
	elif direction == Vector2.LEFT:
		animation.play("walk_left")
	elif direction == Vector2.UP:
		animation.play("walk_up")
	elif direction == Vector2.DOWN:
		animation.play("walk_down")
	
	if direction != Vector2.ZERO: player.last_direction = direction
	player.velocity = direction*speed
	player.move_and_slide()

func _on_next_transitions() -> void:
	if !input_event.is_movement_input():
		transition.emit("idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animation.stop()
