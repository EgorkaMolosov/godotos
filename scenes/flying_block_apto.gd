extends AnimatableBody2D
@onready var colisions = $CollisionShape2D
@onready var sprite = $Sprite2D
var rotation_speed = randf_range(-5,5)
var started = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if started == true:
		self.global_rotation += 0.5*delta * rotation_speed
		colisions.global_rotation = 0
		sprite.global_rotation =0


func _on_timer_timeout() -> void:
	started = true # Replace with function body.
