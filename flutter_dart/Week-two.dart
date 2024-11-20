Create a Dart program that simulates an online
shopping cart system. Your program should 
implement the following:

Standard Functions:function calculateTotal that 
accepts a list of item prices and returns the 
total price. Implement optional parameters for 
tax calculation
  

** Anonymous Functions:** Use an anonymous function 
to filter out items with a price below a certain
threshold (e.g., items under $10).

Higher-Order Functions: function applyDiscount that 
takes a list of prices and a discount function as 
parameters. The discount function should reduce 
the price by a percentage. Recursive Functions:

Create a recursive function calculateFactorialDiscount
that calculates a special discount based on the 
factorial of the number of items in the cart 
(e.g., if there are 4 items, the discount is 4!
percent). Instructions:

**The program should use the applyDiscount 
function to apply a discount to all items in the
cart. Calculate the final price after applying 
the discount and tax, using the calculateTotal 
function. Use the recursive function for an 
additional special discount and apply it to the 
final price. **
// Standard Function: calculateTotal with optional tax parameter
double calculateTotal(List<double> prices, {double tax = 0.0}) {
  double total = 0;
  
  // Calculate total price
  for (var price in prices) {
    total += price;
  }

  // Apply tax if provided
  if (tax > 0) {
    total += total * tax / 100;
  }

  return total;
}

// Anonymous Function to filter out items with price below a threshold
List<double> filterItems(List<double> prices, double threshold) {
  var filteredItems = prices.where((price) => price >= threshold).toList();
  return filteredItems;
}

// Higher-Order Function: applyDiscount that applies a discount to all items
List<double> applyDiscount(List<double> prices, double Function(double) discountFunc) {
  return prices.map((price) => discountFunc(price)).toList();
}

// Recursive Function: calculateFactorialDiscount calculates a special discount
double calculateFactorialDiscount(int n) {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * calculateFactorialDiscount(n - 1);
  }
}

void main() {
  // List of item prices in the cart
  List<double> prices = [15.99, 5.99, 23.50, 8.99, 12.75];

  // Tax rate (optional parameter)
  double taxRate = 7.0;

  // Threshold for filtering items
  double priceThreshold = 10.0;

  // Step 1: Filter items that are below the price threshold
  var filteredPrices = filterItems(prices, priceThreshold);
  print("Filtered prices (items >= \$10): $filteredPrices");

  // Step 2: Apply a 10% discount to all items
  var discountedPrices = applyDiscount(filteredPrices, (price) => price * 0.9);
  print("Prices after 10% discount: $discountedPrices");

  // Step 3: Calculate the total price after applying tax
  double totalPrice = calculateTotal(discountedPrices, tax: taxRate);
  print("Total price after tax: \$${totalPrice.toStringAsFixed(2)}");

  // Step 4: Calculate special discount based on factorial of the number of items
  int numberOfItems = discountedPrices.length;
  double factorialDiscount = calculateFactorialDiscount(numberOfItems);
  print("Factorial discount for $numberOfItems items: $factorialDiscount%");

  // Step 5: Apply the factorial discount to the total price
  double finalPrice = totalPrice - (totalPrice * factorialDiscount / 100);
  print("Final price after factorial discount: \$${finalPrice.toStringAsFixed(2)}");
}
