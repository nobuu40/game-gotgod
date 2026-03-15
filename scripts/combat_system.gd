extends Node

# Declare member variables here. Examples:
var player_stats = {
    "health": 100,
    "attack": 10,
    "defense": 5,
}

var enemy_stats = {
    "health": 50,
    "attack": 8,
    "defense": 3,
}

func start_battle():
    print("Battle Start!")
    while player_stats["health"] > 0 and enemy_stats["health"] > 0:
        player_attack()
        if enemy_stats["health"] > 0:
            enemy_attack()
    if player_stats["health"] <= 0:
        print("Player has been defeated!")
    else:
        print("Enemy has been defeated!")

func player_attack():
    var damage = player_stats["attack"] - enemy_stats["defense"]
    if damage > 0:
        enemy_stats["health"] -= damage
        print("Player attacks! Enemy health: " + str(enemy_stats["health"]))
    else:
        print("Player's attack was not effective.")

func enemy_attack():
    var damage = enemy_stats["attack"] - player_stats["defense"]
    if damage > 0:
        player_stats["health"] -= damage
        print("Enemy attacks! Player health: " + str(player_stats["health"]))
    else:
        print("Enemy's attack was not effective.")
