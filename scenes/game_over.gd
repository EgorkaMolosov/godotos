extends CanvasLayer
@onready var prev_level = get_tree().get_first_node_in_group("scenes")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_youdied_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_choose.tscn")# Replace with function body.


func _on_button_pressed() -> void:
	get_tree().quit()# Replace with function body.


func _on_replay_pressed() -> void:
	get_tree().change_scene_to_packed(prev_level) # Replace with function body.
	prev_level.remove_from_group("scenes")
