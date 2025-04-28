extends CharacterBody2D

@onready var game_over_timer = $Timer
@onready var game_over = $"."
@onready var death_sound =$death_sound
@onready var jump_sound = $jump_sound
@onready var animated_sprite = $AnimatedSprite2D
@onready var aura = $aura
@onready var timer = $Timer
var SPEED = 300.0
var JUMP_VELOCITY = -300.0
var gravity = 980
var time = 0.00
@onready var count = get_parent().get_node('GUI_IN_GAME/Label')
@onready var door = get_parent().get_node('door')
@onready var parallax = get_parent().get_node('ParallaxBackground')
@onready var navigation = get_parent().get_node('NavigationRegion2D')
@onready var gui = get_parent().get_node('GUI_IN_GAME')
var level_file = null
var is_dead = false
var in_honey = false
var level_ended = false

func _ready() -> void:
	GlobalInfo.score = 0
	if not GlobalInfo.multiplay:
		queue_free()
	level_file = get_parent().scene_file_path
	parallax.set_scroll_offset(GlobalInfo.parallax)
	Bridge.advertisement.connect("interstitial_state_changed", Callable(self, "_on_interstitial_state_changed"))

func _process(delta: float) -> void:
	if GlobalInfo.started == false:
		gui._on_retry_pressed()
		GlobalInfo.started = true
	if GlobalInfo.score == 13:
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
	if Input.is_action_just_pressed("ui_home") and is_on_floor():
		jump_sound.play()
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_page_up", "ui_page_down")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed("ui_end"):
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
			GlobalInfo.score += 1
			count.set_text('score: '+str(GlobalInfo.score))
			area.add_to_group("ignored")
		else:
			pass
	elif area.has_method('_open'):
		if not area.is_in_group("ignored"):
			timer.stop()
			print(level_file)
			print(time)
			if level_file == 'res://scenes/node.tscn':
				if time < GlobalInfo.time1:
					GlobalInfo.time1 = time
					GlobalInfo.level1_done = true
			elif level_file == 'res://scenes/level_2.tscn':
				if time < GlobalInfo.time2:
					GlobalInfo.time2 = time
					GlobalInfo.level2_done = true
			elif level_file == 'res://scenes/level_3.tscn':
				if time < GlobalInfo.time3:
					GlobalInfo.time3 = time
					GlobalInfo.level3_done = true
			elif level_file == 'res://scenes/level_4.tscn':
				if time < GlobalInfo.time4:
					GlobalInfo.time4 = time
					GlobalInfo.level4_done = true
			elif level_file == 'res://scenes/level_5.tscn':
				if time < GlobalInfo.time5:
					GlobalInfo.time5 = time
					GlobalInfo.level5_done = true
			elif level_file == 'res://scenes/level_6.tscn':
				if time < GlobalInfo.time6:
					GlobalInfo.time6 = time
					GlobalInfo.level6_done = true
			elif level_file == 'res://scenes/level_7.tscn':
				if time < GlobalInfo.time7:
					GlobalInfo.time7 = time
					GlobalInfo.level7_done = true
			elif level_file == 'res://scenes/level_8.tscn':
				if time < GlobalInfo.time8:
					GlobalInfo.time8 = time
					GlobalInfo.level9_done = true
			get_tree().change_scene_to_file('res://scenes/molodec.tscn')
			#Bridge.advertisement.show_interstitial()
	elif area.has_method('_honey'):
		in_honey = true
		area._honey()
		gravity = 0
	elif area.has_method('_dmg_spikes_method'):
		pass
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

func _on_timer_timeout() -> void:
	time += 0.01 # Replace with function body.
