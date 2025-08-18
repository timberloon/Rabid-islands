extends StaticBody2D
var dead = false
var inside = false
@onready var chop_time: Timer = $chop_time
@onready var animation: AnimatedSprite2D = $animation
var player:CharacterBody2D
@onready var standing_collision: CollisionShape2D = $standing_collision
@onready var wait_time: Timer = $wait_time
var check = false
var onedead = false
var shake = true
@onready var chop_zone: Area2D = $chop_zone
@onready var shake_time: Timer = $shake_time

var log_scene = preload("res://scenes/log.tscn")

func _physics_process(delta: float) -> void:
	if inside and player and player.chopping and not dead:
		if chop_time.is_stopped():
			chop_time.start()
		
	if not chop_time.is_stopped():
		if shake:
			animation.material.set_shader_parameter("shake_intensity",2.0)
			if shake_time.is_stopped():shake_time.start()
		else:
			animation.material.set_shader_parameter("shake_intensity",0.0)
			if shake_time.is_stopped():shake_time.start()

		
		
	if player and not player.chopping:
		if not chop_time.is_stopped(): chop_time.stop()
		animation.material.set_shader_parameter("shake_intensity",0.0)
		
	if dead and not onedead:
		animation.material.set_shader_parameter("shake_intensity",0.0)
		if wait_time.is_stopped():
			wait_time.start()
		if not check:
			animation.play("fall")
			check = true
		

func _on_chop_zone_body_entered(body: Node2D) -> void:
	if not player and body is CharacterBody2D: player = body
	inside = true
	
func _on_chop_zone_body_exited(body: Node2D) -> void:
	if not chop_time.is_stopped(): chop_time.stop()
	inside = false

func _on_chop_time_timeout() -> void:
	dead = true

func _on_wait_time_timeout() -> void:
	standing_collision.queue_free()
	chop_zone.queue_free()
	animation.visible = false
	call_deferred("add_log")
	onedead = true

func add_log()->void:
	var log = log_scene.instantiate()
	log.position = position
	get_parent().add_child(log)


func _on_shake_time_timeout() -> void:
	shake = not shake
