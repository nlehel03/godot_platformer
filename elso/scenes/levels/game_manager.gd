extends Node
@onready var gui_scene =preload("res://scenes/menu/GUI.tscn")
var gui_instance: Node =null
var points_label: Label = null

func _ready() ->void:
	gui_instance=gui_scene.instantiate()
	get_tree().root.add_child(gui_instance)
	gui_instance.name="GUI"
	points_label = gui_instance.get_node("UI/Panel/PointsLabel")
	print("gui példányosítva:",get_tree().root.get_child_count())


@export var hearts: Array[Node]


var points=0
var lives=3

func decrease_health():
	lives-=1
	for i in range(3):
		if(i<lives):
			hearts[i].show()
		else:
			hearts[i].hide()
	if(lives==0):
		get_tree().reload_current_scene()

func add_point():
	points+=1
	print(points)
	if points_label:
		points_label.text="Points: "+str(points)
	else:
		points_label.text="points_label nem található"
	
