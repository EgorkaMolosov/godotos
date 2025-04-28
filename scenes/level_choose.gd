extends Node2D
@onready var gui = $gui
@onready var parallax = $ParallaxBackground
@onready var leave = $gui/Button_Leave
@onready var menu = $gui/Button_Leave2
var scroll_offset := Vector2.ZERO
var new_pos = 0
var new_pos_leave = 8
var new_pos_menu = 1056
var cursor = load('res://ui/Cursors_v2/Light/Arrows/Arrow1.png')
var hand = load('res://ui/Cursors_v2/Light/Hands/Hand1.png')

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parallax.set_scroll_offset(GlobalInfo.parallax) # Replace with function body.
	var new_pos_leave = leave.position.x
	var new_pos_menu = menu.position.x
	if GlobalInfo.level1_done == true:
		$gui/Button_first/Sprite2D.visible = true
		$gui/Button_first/Label.text = "%3.2f" % GlobalInfo.time1
	if GlobalInfo.level2_done == true:
		$gui/Button_second/Sprite2D.visible = true
		$gui/Button_second/Label.text = "%3.2f" % GlobalInfo.time2
	if GlobalInfo.level3_done == true:
		$gui/Button_third/Sprite2D.visible = true
		$gui/Button_third/Label.text = "%3.2f" % GlobalInfo.time3
	if GlobalInfo.level4_done == true:
		$gui/Button_fourth/Sprite2D.visible = true
		$gui/Button_fourth/Label.text = "%3.2f" % GlobalInfo.time4
	if GlobalInfo.level5_done == true:
		$gui/Button_fifth/Sprite2D.visible = true
		$gui/Button_fifth/Label.text = "%3.2f" % GlobalInfo.time5
	if GlobalInfo.level6_done == true:
		$gui/Button_sixth/Sprite2D.visible = true
		$gui/Button_sixth/Label.text = "%3.2f" % GlobalInfo.time6
	if GlobalInfo.level7_done == true:
		$gui/Button_seventh/Sprite2D.visible = true
		$gui/Button_seventh/Label.text = "%3.2f" % GlobalInfo.time7
	if GlobalInfo.level8_done == true:
		$gui/Button_eight/Sprite2D.visible = true
		$gui/Button_eight/Label.text = "%3.2f" % GlobalInfo.time8
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	gui.position = gui.position.lerp(Vector2(new_pos, gui.position.y), delta * 10)
	leave.position = leave.position.lerp(Vector2(new_pos_leave, leave.position.y), delta * 10)
	menu.position = menu.position.lerp(Vector2(new_pos_menu,menu.position.y), delta*10)

func _on_button_leave_pressed() -> void:
	get_tree().quit()
func _on_button_leave_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(hand) # Replace with function body.
func _on_button_leave_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(cursor) # Replace with function body.


func _on_button_arrow_right_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(hand) # Replace with function body.
func _on_button_arrow_right_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(cursor) # Replace with function body.
func _on_button_arrow_left_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(hand) # Replace with function body.
func _on_button_arrow_left_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(cursor) # Replace with function body.


func _on_button_arrow_left__pressed() -> void:
	new_pos = gui.position.x - 1280
	new_pos_leave = leave.position.x + 1280
	new_pos_menu = menu.position.x + 1280
func _on_button_right_pressed() -> void:
	new_pos = gui.position.x + 1280
	new_pos_leave = leave.position.x - 1280
	new_pos_menu = menu.position.x - 1280


func _on_button_change_level_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(hand) # Replace with function body.
func _on_button_change_level_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(cursor) # Replace with function body.


func _on_button_first_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/node.tscn")
	GlobalInfo.started = false # Replace with function body.

func _on_button_second_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	GlobalInfo.started = false # Replace with function body.

func _on_button_third_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")
	GlobalInfo.started = false # Replace with function body.

func _on_button_fourth_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/level_4.tscn")
	GlobalInfo.started = false # Replace with function body.

func _on_button_fifth_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/level_5.tscn")
	GlobalInfo.started = false # Replace with function body.

func _on_button_sixth_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/level_6.tscn")
	GlobalInfo.started = false # Replace with function body.

func _on_button_seventh_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/level_7.tscn")
	GlobalInfo.started = false # Replace with function body.

func _on_button_eight_pressed() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/level_8.tscn")
	GlobalInfo.started = false # Replace with function body.


func _to_menu() -> void:
	GlobalInfo.parallax = parallax.get_scroll_offset()
	get_tree().change_scene_to_file("res://scenes/menu.tscn") # Replace with function body.
