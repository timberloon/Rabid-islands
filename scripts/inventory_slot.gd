extends Panel

@onready var item: Sprite2D = $CenterContainer/Panel/item
@onready var label: Label = $CenterContainer/Panel/Label

func update(curr_item:inv_item)->void:
	if !item:
		item.visible = false
	else:
		item.visible = true
		item.texture = curr_item.texture

func item_text(txt:int):
	label.text = str(txt)


func _on_button_pressed() -> void:
	print("button pressed")
