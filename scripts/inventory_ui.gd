extends Control

@onready var inv = preload("res://inventory/player_inventory.tres")
@onready var slots:Array = $NinePatchRect/GridContainer.get_children()

func _ready() -> void:
	for num in inv.count:
		num = 0

func _process(delta: float) -> void:
	update_items()
	if Input.is_action_just_pressed("inventory"):
		toggle()
		
func update_items()->void:
	for i in range(min(inv.items.size(),slots.size())):
		if inv.items[i] :
			slots[i].update(inv.items[i])
			slots[i].item_text(inv.count[i])

func toggle():
	visible = not visible
