extends Node

# Variables to hold buyer and seller details
var player_items = {}
var npc_items = {}

# Function to enable purchasing an item from the NPC
func buy_item(item_name: String, quantity: int) -> void:
    if item_name in npc_items and npc_items[item_name] >= quantity:
        npc_items[item_name] -= quantity
        player_items[item_name] = (player_items.get(item_name, 0) + quantity)
        print("Purchased " + str(quantity) + " " + item_name + " from NPC.")
    else:
        print("Not enough items or item does not exist.")

# Function for selling an item to the NPC
func sell_item(item_name: String, quantity: int) -> void:
    if item_name in player_items and player_items[item_name] >= quantity:
        player_items[item_name] -= quantity
        npc_items[item_name] = (npc_items.get(item_name, 0) + quantity)
        print("Sold " + str(quantity) + " " + item_name + " to NPC.")
    else:
        print("Not enough items to sell or item does not exist.")

# Function to initialize the NPC inventory
func initialize_npc_inventory(inventory: Dictionary) -> void:
    npc_items = inventory

# Function to get player inventory
func get_player_inventory() -> Dictionary:
    return player_items

# Debugging function to display inventories
func display_inventories() -> void:
    print("NPC Inventory: " + str(npc_items))
    print("Player Inventory: " + str(player_items))