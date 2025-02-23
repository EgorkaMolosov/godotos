extends AnimatableBody2D

const SPEED = 99
@onready var animated_bich = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta):
	var player = get_parent().get_node("player")
	var player_position = player.global_position
	var enemy_position = global_position
	var direction = player_position - enemy_position
	direction = direction.normalized()
	var motion = direction * SPEED * delta
	move_and_collide(motion)
	handle_movement_animation(direction)
	
func _shit_process(delta: float) -> void:
	pass

func toggle_flip_sprite(direction):
	var player = get_parent().get_node("player")
	if global_position > player.global_position:
		animated_bich.play("default")
		animated_bich.flip_h = true
	else:
		animated_bich.play("default")
		animated_bich.flip_h = false

func handle_movement_animation(direction):
	animated_bich.play("default")
	toggle_flip_sprite(direction)
		

func _on_button_pressed() -> void:
	set_physics_process(false)
	animated_bich.play("blow_jop")
	# Replace with function body.

func _on_animated_sprite_2d_animation_finished() -> void:
	set_physics_process(false)
	self.queue_free() # Replace with function body.
