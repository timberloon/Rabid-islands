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

func _physics_process(delta: float) -> void:
	if inside and player and player.chopping and not dead:
		if chop_time.is_stopped():
			chop_time.start()
			print("time start")
	if player and not player.chopping:
		print("time terminated : stopped chopping")
		if not chop_time.is_stopped(): chop_time.stop()
	if dead and not onedead:
		if wait_time.is_stopped():
			print("wait time started")
			wait_time.start()
		if not check:
			animation.play("fall")
			check = true
		

func _on_chop_zone_body_entered(body: Node2D) -> void:
	if not player and body is CharacterBody2D: player = body
	inside = true
	
func _on_chop_zone_body_exited(body: Node2D) -> void:
	if not chop_time.is_stopped(): chop_time.stop()
	print("time terminated : exited")
	inside = false

func _on_chop_time_timeout() -> void:
	print("dead")
	dead = true

func _on_wait_time_timeout() -> void:
	print("wait time ended")
	standing_collision.queue_free()
	animation.visible = false
	onedead = true
