extends Node

var player_position
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
    player_position = get_node("../Player").position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    move_towards_player(delta)

func move_towards_player(delta):
    player_position = get_node("../Player").position
    var direction = (player_position - position).normalized()
    position += direction * speed * delta
