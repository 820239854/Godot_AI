extends Node
class_name BTSequence

signal succeed
signal failed

var current_child_index:int = 0

func _ready() -> void:
	for child in get_children():
		child.connect("succeed", self.child_successed)
		child.connect("failed", self.child_failed)

func run() -> void:
	get_child(current_child_index).run()

func child_successed() -> void:
	current_child_index += 1
	if current_child_index >= get_child_count():
		current_child_index = 0
		succeed.emit()
	else:
		get_child(current_child_index).run()
	
func child_failed() -> void:
	failed.emit()
