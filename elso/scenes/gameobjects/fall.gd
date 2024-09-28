extends Area2D




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if(body.name=="CharacterBody2D"):
		get_tree().reload_current_scene()
		
