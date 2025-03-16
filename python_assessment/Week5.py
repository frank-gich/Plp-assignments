# Parent Class
class Superhero:
    def __init__(self, name, power, origin):
        self.name = name
        self.power = power
        self.origin = origin

    def introduce(self):
        return f"I am {self.name} from {self.origin}, and my power is {self.power}!"

# Child Class 1: Flying Hero
class FlyingHero(Superhero):
    def __init__(self, name, power, origin, flight_speed):
        super().__init__(name, power, origin)
        self.flight_speed = flight_speed  # New attribute

    def introduce(self):
        return super().introduce() + f" I can fly at {self.flight_speed} km/h!"

# Child Class 2: Speedster
class Speedster(Superhero):
    def __init__(self, name, power, origin, running_speed):
        super().__init__(name, power, origin)
        self.running_speed = running_speed  # New attribute

    def introduce(self):
        return super().introduce() + f" I can run at {self.running_speed} km/h!"

# Creating superhero objects
hero1 = FlyingHero("Skyhawk", "Aerokinesis", "Cloud City", 500)
hero2 = Speedster("Flashbolt", "Super Speed", "Metropolis", 1200)

# Printing their introductions
print(hero1.introduce())  # Output: I am Skyhawk from Cloud City...
print(hero2.introduce())  # Output: I am Flashbolt from Metropolis...
