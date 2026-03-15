extends Node

# Planets and Space Locations Procedural Generator

# This script handles the creation of planets and space locations in the game.
class_name WorldGenerator

# List of possible planet types
var planet_types = ["Terrestrial", "Gas Giant", "Ice Giant", "Dwarf Planet"]

# Generate a random planet
func generate_planet():
    var planet_name = "Planet " + str(randi() % 100)
    var planet_type = planet_types[randi() % planet_types.size()]
    var size = rand_range(1000, 10000) # Random size in km
    return {
        "name": planet_name,
        "type": planet_type,
        "size": size,
    }

# Generate a space location
func generate_space_location():
    var location_name = "Location " + str(randi() % 50)
    var distance_from_star = rand_range(1, 100) # Random distance from star in AU
    return {
        "name": location_name,
        "distance_from_star": distance_from_star,
    }

# Example of generating a random planet and location
func _ready():
    var planet = generate_planet()
    var location = generate_space_location()
    print("Generated Planet: " + str(planet))
    print("Generated Space Location: " + str(location))
