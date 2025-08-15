extends CharacterBody2D

var last_direction:Vector2
var chopping:bool = false

func is_chopping()->bool:
	return chopping
