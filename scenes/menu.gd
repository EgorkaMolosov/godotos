extends Node2D

@onready var parallax = $ParallaxBackground
var cursor = load('res://ui/Cursors_v2/Light/Arrows/Arrow1.png')
var hand = load('res://ui/Cursors_v2/Light/Hands/Hand1.png')

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Bridge.platform.send_message("game_ready")# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed()->void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/level_choose.tscn")# Replace with function body.

func _on_button_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(hand) # Replace with function body.
func _on_button_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(cursor) # Replace with function body.
