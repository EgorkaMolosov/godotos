extends CanvasLayer
@onready var parallax = get_parent().get_node("ParallaxBackground")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_retry_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().reload_current_scene() # Replace with function body.


func _on_in_menu_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/level_choose.tscn") # Replace with function body.
