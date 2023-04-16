extends Node
class_name BTEat

signal succeed
signal failed

func run() -> void:
	if owner.hungry == false:
		printerr("Not hungry")
		failed.emit()
	else:
		printerr("Eating")
		await get_tree().create_timer(2).timeout
		printerr("Done eating")
		owner.hungry = false
		succeed.emit()
	pass

func child_successed(child_index:int) -> void:
	pass

func child_failed(child_index:int) -> void:
	pass
