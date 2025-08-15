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
	animation.play("chopping_down")
	player.chopping = true


func _on_exit() -> void:
	player.chopping = true
	animation.stop()
