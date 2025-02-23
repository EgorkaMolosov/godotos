extends CharacterBody2D

@onready var game_over_timer = $Timer
@onready var game_over = $"."
@onready var death_sound =$death_sound
@onready var jump_sound = $jump_sound
@onready var animated_sprite = $AnimatedSprite2D
var SPEED = 300.0
var JUMP_VELOCITY = -300.0
@onready var apple = get_node('scenes/item.tscn') 

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		jump_sound.play()
		velocity.y = JUMP_VELOCITY
		
	
	#if Input.is_action_just_pressed("ui_accept") and not is_on_floor():
	#	velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed("ui_down"):
		if SPEED == 200.0:
			SPEED = 300.0
			JUMP_VELOCITY = -300
		else:
			SPEED = 200.0
			JUMP_VELOCITY = -600

	move_and_slide()
	handle_movement_animation(direction)

func _on_pickup_area_entered(area: Area2D) -> void:
	if area.has_method("on_pickup"):
		area.on_pickup(self)
	else:
		on_death()

func _dmg_spikes_method(area: Area2D) -> void:
	if area.has_method("_on_area_entered"):
		death_sound.play()

func toggle_flip_sprite(direction):
	if direction == 1:
		animated_sprite.flip_h = false
	if direction == -1:
		animated_sprite.flip_h = true

func handle_movement_animation(direction):
	if !velocity:
		animated_sprite.play("idle")
	if velocity.x and !velocity.y:
		animated_sprite.play("run")
		toggle_flip_sprite(direction)
	if velocity.y:
		animated_sprite.play("jump")
		toggle_flip_sprite(direction)

func on_death():
	death_sound.play()
	animated_sprite.play("death")
	set_physics_process(false)

func _animation_death_finished() -> void:
	self.queue_free()
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if position.y > 720:
		on_death()
	else:
		pass # Replace with function body.


func _on_pickup_area_body_entered(body: Node2D) -> void:
	if body.has_method("_shit_process"):
		on_death()# Replace with function body.
