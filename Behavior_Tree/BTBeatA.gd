extends Node
class_name BTBeatA

signal succeed
signal failed

func run() -> void:
	var random = randf()
	if random < 0.5:
		print("BeatA succeed")
		succeed.emit()
	else:
		print("BeatA failed")
		failed.emit()
