# spaceship_controller.gd

extends Node2D

# Spaceship traits
var speed = 400
var rotation_speed = 5.0

func _process(delta):
    # Handle spaceship movement and navigation
    var direction = Vector2()
    if Input.is_action_pressed("ui_up"):
        direction.y -= 1
    if Input.is_action_pressed("ui_down"):
        direction.y += 1
    if Input.is_action_pressed("ui_left"):
        rotation_degrees -= rotation_speed
    if Input.is_action_pressed("ui_right"):
        rotation_degrees += rotation_speed

    # Move the spaceship
    direction = direction.normalized() * speed * delta
    position += direction.rotated(rotation_degrees)