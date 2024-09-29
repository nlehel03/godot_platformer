extends Node2D
@onready var heart_1: TextureRect = $UI/Hearts/HBoxContainer/Heart1
@onready var heart_2: TextureRect = $UI/Hearts/HBoxContainer/Heart2
@onready var heart_3: TextureRect = $UI/Hearts/HBoxContainer/Heart3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_manager.healthChangeSignal.connect(playerHealthChanged)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func playerHealthChanged(playerHealth:int):
	if playerHealth==3:
		heart_1.show()
		heart_2.show()
		heart_3.show()
	elif playerHealth==2:
		heart_1.show()
		heart_2.show()
		heart_3.hide()
	elif playerHealth==1:
		heart_1.show()
		heart_2.hide()
		heart_3.hide()
	elif playerHealth==0:
		heart_1.hide()
		heart_2.hide()
		heart_3.hide()
