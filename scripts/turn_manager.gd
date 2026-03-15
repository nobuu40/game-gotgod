extends Node

# TurnManager class handles turn progression in a turn-based game.

class_name TurnManager

var current_turn : int = 0
var total_turns : int = 0
var entities : Array = []

# Signal emitted when the turn advances
signal turn_advanced(current_turn)

func _ready():
    pass

func add_entity(entity):
    entities.append(entity)

func set_total_turns(turns:int):
    total_turns = turns

func advance_turn():
    current_turn += 1
    if current_turn > total_turns:
        current_turn = 1 # Restarting to first turn
    emit_signal("turn_advanced", current_turn)
    notify_entities() 

func notify_entities():
    for entity in entities:
        entity.on_turn_advanced(current_turn)  # Assuming each entity has this method

