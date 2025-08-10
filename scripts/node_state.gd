class_name NodeState
extends Node

@warning_ignore("unused_signal")
signal transition 

var speed = Vector2(55,40)
var accel = 10
var decel = 5
var direction:Vector2

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
