Assignment Questions:

Encapsulation:

Create a class that encapsulates data and methods. Ensure that sensitive data is hidden using private variables and controlled access methods.
class BankAccount {
  // Private variables
  String _accountHolderName;
  String _accountNumber;
  double _balance;

  // Constructor
  BankAccount(this._accountHolderName, this._accountNumber, this._balance);

  // Getter for account holder name (read-only access)
  String get accountHolderName => _accountHolderName;

  // Getter for account balance (read-only access)
  double get balance => _balance;

  // Method to deposit money (controlled access)
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited \$${amount.toStringAsFixed(2)} successfully.");
    } else {
      print("Invalid deposit amount.");
    }
  }

  // Method to withdraw money (controlled access)
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrew \$${amount.toStringAsFixed(2)} successfully.");
    } else {
      print("Invalid withdrawal amount or insufficient balance.");
    }
  }

  // Method to display account information
  void displayAccountInfo() {
    print("Account Holder: $_accountHolderName");
    print("Account Number: $_accountNumber");
    print("Current Balance: \$${_balance.toStringAsFixed(2)}");
  }
}

void main() {
  // Creating a BankAccount object
  BankAccount account = BankAccount("John Doe", "123456789", 1000.0);

  // Display initial account information
  account.displayAccountInfo();

  // Perform transactions
  account.deposit(500.0);
  account.withdraw(300.0);
  account.withdraw(1500.0);

  // Display updated account information
  account.displayAccountInfo();
}
Inheritance:

Implement a subclass that inherits properties and methods from a superclass.
// Superclass
class Vehicle {
  String _brand;
  int _year;

  // Constructor
  Vehicle(this._brand, this._year);

  // Method to display vehicle details
  void displayDetails() {
    print("Brand: $_brand");
    print("Year: $_year");
  }
}

// Subclass
class Car extends Vehicle {
  int _numberOfDoors;

  // Constructor
  Car(String brand, int year, this._numberOfDoors) : super(brand, year);

  // Method specific to Car
  void honk() {
    print("The car is honking: Beep! Beep!");
  }

  // Overriding the displayDetails method
  @override
  void displayDetails() {
    super.displayDetails(); // Call the superclass method
    print("Number of Doors: $_numberOfDoors");
  }
}

void main() {
  // Create a Car object
  Car myCar = Car("Toyota", 2020, 4);

  // Display car details
  myCar.displayDetails();

  // Use the honk method
  myCar.honk();
}
Polymorphism: 
Demonstrate method overriding where different subclasses have their unique implementation of a common method.
// Superclass
abstract class Animal {
  String name;

  Animal(this.name);

  // Common method to be overridden
  void makeSound() {
    print("$name makes a sound.");
  }
}

// Subclass 1
class Dog extends Animal {
  Dog(String name) : super(name);

  // Overriding the makeSound method
  @override
  void makeSound() {
    print("$name barks: Woof! Woof!");
  }
}

// Subclass 2
class Cat extends Animal {
  Cat(String name) : super(name);

  // Overriding the makeSound method
  @override
  void makeSound() {
    print("$name meows: Meow! Meow!");
  }
}

// Subclass 3
class Bird extends Animal {
  Bird(String name) : super(name);

  // Overriding the makeSound method
  @override
  void makeSound() {
    print("$name chirps: Tweet! Tweet!");
  }
}

void main() {
  // Create a list of animals
  List<Animal> animals = [
    Dog("Buddy"),
    Cat("Whiskers"),
    Bird("Tweety")
  ];

  // Call makeSound for each animal
  for (var animal in animals) {
    animal.makeSound();
  }
}
Abstraction:

Create abstract classes and define abstract methods that are implemented by subclasses.
// Abstract class
abstract class Shape {
  // Abstract method to calculate area
  double calculateArea();

  // Abstract method to calculate perimeter
  double calculatePerimeter();

  // Non-abstract method (optional)
  void displayDetails() {
    print("Shape details:");
  }
}

// Subclass 1: Circle
class Circle extends Shape {
  double radius;

  Circle(this.radius);

  // Implementing abstract methods
  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }

  @override
  double calculatePerimeter() {
    return 2 * 3.14 * radius;
  }
}

// Subclass 2: Rectangle
class Rectangle extends Shape {
  double length;
  double width;

  Rectangle(this.length, this.width);

  // Implementing abstract methods
  @override
  double calculateArea() {
    return length * width;
  }

  @override
  double calculatePerimeter() {
    return 2 * (length + width);
  }
}

void main() {
  // Create instances of the subclasses
  Shape circle = Circle(5);
  Shape rectangle = Rectangle(10, 4);

  // Display details for Circle
  circle.displayDetails();
  print("Circle Area: ${circle.calculateArea()}");
  print("Circle Perimeter: ${circle.calculatePerimeter()}\n");

  // Display details for Rectangle
  rectangle.displayDetails();
  print("Rectangle Area: ${rectangle.calculateArea()}");
  print("Rectangle Perimeter: ${rectangle.calculatePerimeter()}");
}
