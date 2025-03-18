extends Area2D
var body_in = false
@onready var current_body = null
var old_SPEED = null
var old_JUMP_VELOCITY = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if body_in == true:
		current_body.position = current_body.position.lerp(self.position, delta*0.3)

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("_physics_process"):
		body_in = true
		current_body = body
		old_SPEED = body.SPEED
		body.SPEED /= 3
		if body.has_method('on_death'):
			old_JUMP_VELOCITY = body.JUMP_VELOCITY
			body.JUMP_VELOCITY /= 3 # Replace with function body.

func _on_body_exited(body: Node2D) -> void:
	body_in = false
	current_body = null
	body.SPEED = old_SPEED
	if body.has_method('on_death'):
			body.JUMP_VELOCITY = old_JUMP_VELOCITY # Replace with function body. # Replace with function body.
