extends StateBase

@export var wait_time:float = 2

func _ready()->void:
	state_name = "state_1"

func enter(msg:Dictionary = {})->void:
	print_debug("entering state1")
	await get_tree().create_timer(wait_time, false).timeout
	owner.transition_to("state_2", {"wait_time": wait_time})

func exit()->void:
	print_debug("exiting state1")
