extends Node2D
@onready var gui = $gui
@onready var parallax = $ParallaxBackground
var scroll_offset := Vector2.ZERO
var new_pos = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parallax.set_scroll_offset(GlobalInfo.parallax) # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	gui.position = gui.position.lerp(Vector2(new_pos, gui.position.y), delta * 10)

func _on_button_leave_pressed() -> void:
	get_tree().quit()


func _on_button_arrow_left__pressed() -> void:
	new_pos = gui.position.x - 1280

func _on_button_right_pressed() -> void:
	new_pos = gui.position.x + 1280

func _on_button_first_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/node.tscn") # Replace with function body.

func _on_button_second_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/level_2.tscn") # Replace with function body.

func _on_button_third_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/level_3.tscn") # Replace with function body.

func _on_button_fourth_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/level_4.tscn") # Replace with function body.

func _on_button_fifth_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/level_5.tscn") # Replace with function body.
