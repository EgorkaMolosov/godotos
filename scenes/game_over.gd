extends CanvasLayer
@onready var parallax = $ParallaxBackground

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parallax.set_scroll_offset(GlobalInfo.parallax) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_youdied_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/level_choose.tscn")# Replace with function body.


func _on_button_pressed() -> void:
	get_tree().quit()# Replace with function body.


func _on_replay_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file(GlobalInfo.prev_level) # Replace with function body.
