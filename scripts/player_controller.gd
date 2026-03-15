extends KinematicBody2D

# Define variables
var speed = 100
var velocity = Vector2()
var grid_size = 32

func _process(delta):
    # Reset velocity
    velocity = Vector2()

    # Input handling
    if Input.is_action_pressed("ui_up"):
        velocity.y -= speed
    elif Input.is_action_pressed("ui_down"):
        velocity.y += speed
    if Input.is_action_pressed("ui_left"):
        velocity.x -= speed
    elif Input.is_action_pressed("ui_right"):
        velocity.x += speed

    # Normalize the velocity to maintain consistent speed
    velocity = velocity.normalized() * speed

    # Move the player
    if velocity != Vector2():
        move_and_collide(velocity * delta)
        # Snap to grid after movement
        position.x = round(position.x / grid_size) * grid_size
        position.y = round(position.y / grid_size) * grid_size

func _input(event):
    # Advance turn on player input
    if event.is_action_pressed("ui_accept"):
        print("Turn advanced")
