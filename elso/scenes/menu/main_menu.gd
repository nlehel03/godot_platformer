extends Node2D





func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/lvl1.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/lvl2.tscn")
