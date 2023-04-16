extends Node
class_name Behavior_Tree

var hungry: bool = true
var tired: bool = true
@onready var root_node = get_child(0)

func _ready():
	root_node.connect("succeed", self.root_node_successed)
	root_node.connect("failed", self.root_node_failed)
	root_node.run()

func root_node_successed():
	root_node.run()

func root_node_failed():
	root_node.run()
