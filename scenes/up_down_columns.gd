extends Node2D
@onready var column1 = $column1
@onready var column2 = $column2
@onready var column3 = $column3
@onready var column4 = $column4
var old_pos1 = null
var old_pos2 = null
var old_pos3 = null
var old_pos4 = null
var new_pos1 = null
var new_pos2 = null
var new_pos3 = null
var new_pos4 = null
var rng = RandomNumberGenerator.new()
var down1 = false
var down2 = false
var down3 = false
var down4 = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	old_pos1 = column1.position.y
	old_pos2 = column2.position.y
	old_pos3 = column3.position.y
	old_pos4 = column4.position.y
	new_pos1 = column1.position.y + 80
	new_pos2 = column2.position.y + 80
	new_pos3 = column3.position.y + 80
	new_pos4 = column4.position.y + 80
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	column1.position.y = lerp(column1.position.y, new_pos1, delta*3.5)
	column2.position.y = lerp(column2.position.y, new_pos2, delta*5)
	column3.position.y = lerp(column3.position.y, new_pos3, delta*4)
	column4.position.y = lerp(column4.position.y, new_pos4, delta*2.5)
	if column1.position.y == old_pos1+80:
		new_pos1 -= 80
	if column2.position.y == old_pos2+80:
		new_pos2 -= 80
	if column3.position.y > old_pos3+80:
		new_pos3 -= 80
	if column4.position.y > old_pos4+80:
		new_pos4 -= 80
	if column1.position.y == old_pos1:
		new_pos1 += 80
	if column2.position.y == old_pos2:
		new_pos2 += 80
	if column3.position.y == old_pos3:
		new_pos3 += 80
	if column4.position.y == old_pos4:
		new_pos4 += 80
