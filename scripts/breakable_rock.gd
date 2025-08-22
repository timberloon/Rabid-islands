extends StaticBody2D

@onready var chop_time: Timer = $chop_time
@onready var wait_time: Timer = $wait_time
@onready var standing_collision: CollisionShape2D = $standing_collision
@onready var chop_zone: Area2D = $chop_zone
@onready var animation: AnimatedSprite2D = $animation

var dead = false
var inside = false
var player:CharacterBody2D
var check = false
var onedead = false
var shake = true

func _physics_process(delta: float) -> void:
	if inside and player and player.chopping and not dead:
		if chop_time.is_stopped():
			chop_time.start()
			animation.play("intmd")
		
	if player and not player.chopping and not dead:
		animation.play("idle")
		if not chop_time.is_stopped(): chop_time.stop()

	if dead and not onedead:
		if wait_time.is_stopped():
			wait_time.start()
		if not check:
			animation.play("breaking")
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
	onedead = true
