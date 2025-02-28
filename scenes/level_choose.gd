extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_leave_pressed() -> void:
	get_tree().quit()


func _on_button_first_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/node.tscn") # Replace with function body.

func _on_button_second_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_2.tscn") # Replace with function body.

func _on_button_third_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_3.tscn") # Replace with function body.

func _on_button_fourth_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_4.tscn") # Replace with function body.
