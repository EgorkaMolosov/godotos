extends CharacterBody2D

var SPEED = 99
@onready var animated_bich = $AnimatedSprite2D
@onready var player2 = null
@onready var player = get_parent().get_parent().get_node("player")
@onready var navigation_agent = $NavigationAgent2D

# Called when the node enter"res://scenes/bats.gd"s the scene tree for the first time.
func _ready():
	navigation_agent.set_avoidance_priority(5.00)
	if GlobalInfo.multiplayer:
		player2 = get_parent().get_parent().get_node("player2")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta):
	if player2 == null:
		navigation_agent.target_position = Vector2(player.global_position.x,player.global_position.y-10)
	else:
		if ((player.position.x - self.position.x)**2 + (player.position.y - self.position.y)**2)**0.5 < ((player2.position.x - self.position.x)**2 + (player2.position.y - self.position.y)**2)**0.5:
			navigation_agent.target_position = Vector2(player.global_position.x,player.global_position.y-10)
		else:
			navigation_agent.target_position = Vector2(player2.global_position.x,player2.global_position.y-10)
	velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
	move_and_slide()
	handle_movement_animation()
	
func _shit_process(delta: float) -> void:
	pass

func toggle_flip_sprite():
	if global_position > navigation_agent.target_position:
		animated_bich.play("default")
		animated_bich.flip_h = true
	else:
		animated_bich.play("default")
		animated_bich.flip_h = false

func handle_movement_animation():
	toggle_flip_sprite()
