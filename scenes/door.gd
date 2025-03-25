extends Area2D

@onready var collision_shape = $CollisionShape2D
@onready var collect_sound = $collect_sound
@onready var Animated_sprite = $AnimatedSprite2D
var mass = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.add_to_group("ignored")
	Animated_sprite.play('default') # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mass == true:
		Animated_sprite.play('opened')

func _open():
	Animated_sprite.play('open')
	self.remove_from_group("ignored")
	
 # Replace with function body.


func _on_animated_sprite_2d_animation_finished() -> void:
	if not self.is_in_group("ignored"):
		if mass == false:
			mass = true# Replace with function body.
		if mass == true:
			Animated_sprite.play('opened')
	
