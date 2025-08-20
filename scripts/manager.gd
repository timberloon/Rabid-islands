extends Node2D

var player_inventory = preload("res://inventory/player_inventory.tres")
var curr = 0
var player_inv_check = false

func add_to_player_inventory(item:inv_item)->void:
	for i in range(player_inventory.items.size()):
		if player_inventory.items[i] == item:
			player_inventory.count[i] += 1
			player_inv_check = true
	
	if not player_inv_check:
		player_inventory.items[curr] = item
		curr += 1
		player_inv_check = true
	if curr >= player_inventory.items.size(): curr = 0
