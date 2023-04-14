extends Node

@export var initial_state:NodePath

var  curr_state:StateBase = null

var states: Array = get_children()

func launch()->void:
	assert(initial_state != null, "init is null")
	curr_state = get_node(initial_state)
	curr_state.enter()
	pass