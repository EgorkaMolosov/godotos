extends AnimatableBody2D
@onready var colisions = $CollisionShape2D
@onready var sprite = $Sprite2D
var rotation_speed = randf_range(4,5)
var rotation_side = randf_range(-1,1)
var started = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if rotation_side>=0:
		rotation_side = 1
	else:
		rotation_side = -1 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if started == true:
		self.global_rotation -= 0.5*delta * rotation_speed*rotation_side
		colisions.global_rotation = 0
		sprite.global_rotation =0


func _on_timer_timeout() -> void:
	started = true # Replace with function body.
