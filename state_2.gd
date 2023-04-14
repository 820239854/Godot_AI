extends StateBase

@export var wait_time:float = 2

func _ready()->void:
	state_name = "state_2"

func enter(msg:Dictionary = {})->void:
	print_debug("entering state2")
	print_debug(msg["wait_time"])

func exit()->void:
	print_debug("exiting state2")
