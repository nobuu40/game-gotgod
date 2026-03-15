extends CharacterBody2D

# Enemy AI script
class_name Enemy

var speed = 150
var player: CharacterBody2D
var current_position: Vector2

func _ready():
	add_to_group("enemies")
	player = get_tree().root.get_node("GameScene/Player")
	current_position = position

func _physics_process(delta):
	if player:
		var direction = (player.position - position).normalized()
		velocity = direction * speed
		move_and_collide(velocity * delta)

func on_player_turn():
	# Called when player takes a turn
	print("Enemy at ", position, " responds to player turn")
	if player:
		var direction = (player.position - position).normalized()
		velocity = direction * speed
		move_and_collide(velocity * 0.016)  # Simulate movement