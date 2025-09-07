extends CanvasLayer
@onready var animation: AnimationPlayer = $AnimationPlayer

func change_scene(target:String)->void:
	Manager.take_inputs = false
	animation.play("dissolve")
	await animation.animation_finished
	get_tree().change_scene_to_file(target)
	animation.play_backwards("dissolve")
	await animation.animation_finished
	Manager.scene_changed = true
	Manager.take_inputs = true
