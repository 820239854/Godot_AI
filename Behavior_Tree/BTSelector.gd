extends Node
class_name BTSelector

signal succeed
signal failed

var current_child_index:int = 0

func _ready() -> void:
	for child in get_children():
		child.connect("succeed", self.child_successed)
		child.connect("failed", self.child_failed)

func run() -> void:
	if current_child_index >= get_child_count():
		failed.emit()
	else:
		get_child(current_child_index).run()

func child_successed() -> void:
	succeed.emit()

func child_failed() -> void:
	current_child_index += 1
	if current_child_index >= get_child_count():
		# current_child_index = 0
		failed.emit()
	else:
		get_child(current_child_index).run()
