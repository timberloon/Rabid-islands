extends Node2D

var take_inputs = true

#player pos
var last_pos:Vector2
var scene_changed = false
var last_direction:Vector2

var player_inventory = preload("res://inventory/player_inventory.tres")
var curr = 0
var player_inv_check = false

func add_to_player_inventory(item:inv_item,amount:int)->void:
	for i in range(player_inventory.items.size()):
		if player_inventory.items[i] == item:
			player_inventory.count[i] += amount
			player_inv_check = true
	
	if not player_inv_check:
		player_inventory.items[curr] = item
		player_inventory.count[curr] += amount
		curr += 1
	if curr >= player_inventory.items.size(): curr = 0
