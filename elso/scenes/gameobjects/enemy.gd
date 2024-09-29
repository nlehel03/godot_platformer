extends CharacterBody2D

@onready var game_manager: Node = %GameManager
var gravity=ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 600.0
enum State{Idle,Walk}
var currentState : State
var direction :Vector2=Vector2.LEFT


func _ready():
	currentState=State.Idle

func _physics_process(delta: float) -> void:
	enemyGravity(delta)
	enemy_idle(delta)
	enemy_walk(delta)
	
	
	move_and_slide()

#mozgáshoz kapcsolódók:
func enemyGravity(delta:float):
	velocity.y+=gravity * delta
	
	
func enemy_idle(delta:float):
	velocity.x = move_toward(velocity.x,0,10)
	currentState=State.Idle

func enemy_walk(delta:float):
	velocity.x+=direction.x * SPEED * delta
	currentState=State.Walk 
	



#sebzés
func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name=="CharacterBody2D"):
		var y_delta =position.y -body.position.y
		var x_delta=body.position.x - position.x
		if(y_delta>30):
			print("destroy enemy")
			queue_free()
			body.jump()
		else:
			print("decrease player health")
			game_manager.decrease_health()
			if(x_delta>0):
				body.jump_side(500)
			else:
				body.jump_side(-500)
