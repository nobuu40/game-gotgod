extends CharacterBody2D

# Player movement and control script
class_name Player

var speed = 200
var grid_size = 32
var current_turn = 0

func _ready():
	position = Vector2(400, 300)

func _physics_process(delta):
	handle_input()
	move_and_collide(velocity * delta)

func handle_input():
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
		advance_turn()
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
		advance_turn()
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		advance_turn()
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
		advance_turn()

func advance_turn():
	current_turn += 1
	print("Turn: ", current_turn)
	# Notify enemies and other entities
	get_tree().call_group("enemies", "on_player_turn")

func take_damage(damage: int):
	print("Player took ", damage, " damage")