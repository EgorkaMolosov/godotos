extends Area2D

@onready var collision_shape = $CollisionShape2D
@onready var collect_sound = $collect_sound
@onready var Animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_pickup(body):
	Animated_sprite.play("disapaer")
	collect_sound.play()

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
	self.remove_from_group("ignored")
 # Replace with function body.
