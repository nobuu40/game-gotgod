# Inventory System Script

extends Node

# Player's inventory structure
var inventory = {}

# Function to add item to inventory
func add_item(item_name: String, amount: int = 1):
    if inventory.has(item_name):
        inventory[item_name] += amount
    else:
        inventory[item_name] = amount
    print("Added " + str(amount) + " of " + item_name + " to inventory.")

# Function to remove item from inventory
func remove_item(item_name: String, amount: int = 1):
    if inventory.has(item_name) and inventory[item_name] >= amount:
        inventory[item_name] -= amount
        if inventory[item_name] == 0:
            inventory.erase(item_name)
        print("Removed " + str(amount) + " of " + item_name + " from inventory.")
    else:
        print("Cannot remove " + item_name + ": insufficient quantity.")

# Function to get current inventory
func get_inventory():
    return inventory

# Function to equip item
func equip_item(item_name: String):
    # Logic to equip item (placeholder)
    print("Equipped " + item_name)

# Function to unequip item
func unequip_item(item_name: String):
    # Logic to unequip item (placeholder)
    print("Unequipped " + item_name)