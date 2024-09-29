extends Node
@export var hearts: Array[Node]
var gui_instance: Node =null
#var points_label: Label = null

@onready var points_label: Label = $"../SceneObjects/UI/Panel/PointsLabel"



func _ready() ->void:
	"""var current_scene=get_tree().current_scene
	points_label=current_scene.find_node("PointsLabel",true,false)
	if points_label:
		print("PointsLabel megtalálva")
	else:
		print("PointsLabel nem található")
	"""




var points=0
var lives=3

func decrease_health():
	lives -= 1
	for i in 3:
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
	"""else:
		points_label.text="points_label nem található"""
	
