extends Node

@export var auto_start:bool = true
@export var initial_state:NodePath

var curr_state:StateBase = null

@onready var states: Array = get_children()

func _ready():
	if auto_start:
		launch()

func launch()->void:
	assert(initial_state != null, "init is null")
	curr_state = get_node(initial_state)
	curr_state.enter()
	pass
	
func _physics_process(delta):
	if curr_state.has_method("physics_update"):
		curr_state.physics_update(delta)	
	
func _process(delta):
	if curr_state.has_method("update"):
		curr_state.update(delta)

func has_state(state_name:String)->bool:
	for state in states:
		if "state_name" in state and state.state_name == state_name:
			return true
	return false

func get_state(state_name:String)->StateBase:
	for state in states:
		if "state_name" in state and state.state_name == state_name:
			return state
	return null

func transition_to(state_name:String, msg:Dictionary={} )->void:
	if(has_state(state_name)):
		var state:StateBase = get_state(state_name)
		if state:
			curr_state.exit()
			curr_state = state
			curr_state.enter(msg)
		else:
			print("state not found: " + state_name)
	pass
