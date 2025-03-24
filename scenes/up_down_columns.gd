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

var down1 = false
var down2 = false
var down3 = false
var down4 = false

var speed1 = 7
var speed2 = 10
var speed3 = 8
var speed4 = 5

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
	column1.position.y = lerp(column1.position.y, new_pos1, delta*speed1)
	column2.position.y = lerp(column2.position.y, new_pos2, delta*speed2)
	column3.position.y = lerp(column3.position.y, new_pos3, delta*speed3)
	column4.position.y = lerp(column4.position.y, new_pos4, delta*speed4)
	if column1.position.y > old_pos1+79 and down1 == false:
		column1.position.y = new_pos1
		new_pos1 -= 80
		down1 = true
		speed1 = speed1 / 2
	if column2.position.y > old_pos2+79 and down2 == false:
		column2.position.y = new_pos2
		new_pos2 -= 80
		down2 = true
		speed2 = speed2 / 2
	if column3.position.y > old_pos3+79 and down3 == false:
		column3.position.y = new_pos3
		new_pos3 -= 80
		down3 = true
		speed3 = speed3 / 2
	if column4.position.y > old_pos4+79 and down4 == false:
		column4.position.y = new_pos4
		new_pos4 -= 80
		down4 = true
		speed4 = speed4 / 2
	
	if column1.position.y < old_pos1+1 and down1 == true:
		column1.position.y = old_pos1
		new_pos1 += 80
		down1 = false
		speed1 = speed1 * 2
	if column2.position.y < old_pos2+1 and down2 == true:
		column2.position.y = old_pos2
		new_pos2 += 80
		down2 = false
		speed2 = speed2 * 2
	if column3.position.y < old_pos3+1 and down3 == true:
		column3.position.y = old_pos3
		new_pos3 += 80
		down3 = false
		speed3 = speed3 * 2
	if column4.position.y < old_pos4+1 and down4 == true:
		column4.position.y = old_pos4
		new_pos4 += 80
		down4 = false
		speed4 = speed4 * 2
