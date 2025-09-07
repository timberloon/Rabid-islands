extends CharacterBody2D

var chopping:bool = false
var last_pos:Vector2
var scene_changed = false

func is_chopping()->bool:
	return chopping
