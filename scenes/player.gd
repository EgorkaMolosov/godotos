extends CharacterBody2D

@onready var game_over_timer = $Timer
@onready var game_over = $"."
@onready var death_sound =$death_sound
@onready var jump_sound = $jump_sound
@onready var animated_sprite = $AnimatedSprite2D
@onready var aura = $aura
var SPEED = 300.0
var JUMP_VELOCITY = -300.0
var gravity = 980
var score = 0
@onready var count = get_parent().get_node('GUI_IN_GAME/Label')
@onready var door = get_parent().get_node('door')
@onready var parallax = get_parent().get_node('ParallaxBackground')
@onready var navigation = get_parent().get_node('NavigationRegion2D')
@onready var honey = null
var level_file = null
var is_dead = false
var in_honey = false

func _ready() -> void:
	level_file = get_parent().scene_file_path
	parallax.set_scroll_offset(GlobalInfo.parallax)

func _process(delta: float) -> void:
	if score == 13:
		door._open()
	navigation.bake_navigation_polygon()
	if SPEED == 200.0:
		aura.visible =false
	else:
		aura.visible = true
	if in_honey:
		self.position = self.position.lerp(GlobalInfo.honey.global_position,delta*10)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		jump_sound.play()
		velocity.y = JUMP_VELOCITY
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

func _on_pickup_area_entered(area: Area2D):
	if area.has_method("on_pickup"):
		if not area.is_in_group("ignored"):
			area.on_pickup(self)
			score += 1
			count.set_text('score: '+str(score))
			area.add_to_group("ignored")
		else:
			pass
	elif area.has_method('_open'):
		if not area.is_in_group("ignored"):
			get_tree().change_scene_to_file('res://scenes/molodec.tscn')
	elif area.has_method('_honey'):
		in_honey = true
		area._honey()
		gravity = 0
	else:
		on_death()

func _on_pickup_area_area_exited(area: Area2D) -> void:
	if area.has_method('_honey'):
		in_honey = false
		gravity = 980

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
	if not is_on_floor():
		animated_sprite.play("jump")
		toggle_flip_sprite(direction)

func on_death():
	if is_dead == false:
		death_sound.play()
		count.set_text('score: 0')
		animated_sprite.play("death")
		set_physics_process(false)
		GlobalInfo.prev_level = level_file
		is_dead = true

func _animation_death_finished() -> void:
	self.queue_free()
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if position.y > 720:
		on_death()
	else:
		pass # Replace with function body.


func _on_pickup_area_body_entered(body: Node2D) -> void:
	if body.has_method("_shit_process"):
		if position.y - body.position.y < -3:
			body.queue_free()
		else:
			on_death()# Replace with function body.
