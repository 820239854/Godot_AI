extends Node
class_name BTBeatB

signal succeed
signal failed

func run() -> void:
	var random = randf()
	if random < 0.5:
		print("BeatB succeed")
		succeed.emit()
	else:
		print("BeatB failed")
		failed.emit()
