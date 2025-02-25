extends Node
@onready var player = $player
@onready var count = $Control/Label

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mob_timer_timeout():
	player._on_pickup_area_entered.connect(count._count_update.bind())
