extends Node
@onready var player = $player
@onready var count = $Control/Label
var score = 0
func _ready():
	player._on_pickup_area_entered().connect(self._score_update())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _score_update():
	score += 1
	count.text = str(score)
	print(score)
