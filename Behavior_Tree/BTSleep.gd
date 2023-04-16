extends Node
class_name BTSleep

signal succeed
signal failed

func run() -> void:
	if owner.tired == false:
		printerr("I'm not tired")
		failed.emit()
	else:
		print("I'm tired")
		await get_tree().create_timer(3).timeout
		print("I'm not tired anymore")
		owner.tired = false
		succeed.emit()
