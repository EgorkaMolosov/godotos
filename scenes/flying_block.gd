extends AnimatableBody2D
@onready var colisions = $CollisionShape2D
@onready var sprite = $Sprite2D
var rotation_speed = randf_range(6,12)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.global_rotation += delta * rotation_speed
	colisions.rotation -= delta * rotation_speed
	sprite.rotation -= delta * rotation_speed
