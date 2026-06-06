import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/models/cart_item.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{
  //list of food menu
  final List<Food> _menu = [
    //burgers
   
    Food(
      name: "Classic Cheeseburger", 
      description: "A juicy beef patty with melted cheddar, lettuce, and a hint of onion and pickle.",
      imagePath: "lib/Images/burgers/cheese_burger.png", 
      price: 0.99, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 0.99),
      ],
    ),
    Food(
      name: "veggie burger", 
      description: "A hearty patty topped with fresh avacado, lettuce, and tomato, perfect for a vegies lover.",
      imagePath: "lib/Images/burgers/vegetable_burger.webp", 
      price: 1.99, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "vegan Cheese", price: 0.99),
        Addon(name: "Grilled Mushrooms", price: 1.49),
        Addon(name: "Hummus Spread", price: 1.99),
      ],
    ),
    Food(
      name: "Alpha Burger", 
      description: "A juicy grilled double-beef burger with melted cheese, fresh lettuce and crisp onions in a soft sesame bun.",
      imagePath: "lib/Images/burgers/alpha_burger.jpg", 
      price: 9.49, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "Teriyaki Glaze", price: 0.99),
        Addon(name: "Extra Pineapple", price: 0.99),
        Addon(name: "Bacon", price: 1.49),
      ],
    ),
    Food(
      name: "Blue Moon Burger", 
      description: "This burger is a blue cheese lover's dream. It features a succulet ground beef patty, topped with tangy sauces and blue cheese.",
      imagePath: "lib/Images/burgers/bluemoon_burger.jpg", 
      price: 5.49, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "Sauteed Mushrooms", price: 0.99),
        Addon(name: "Fried Egg", price: 1.49),
        Addon(name: "Spicy Mayo", price: 0.99),
      ], 
    ),
    
    //salads
    Food(
      name: "Caesar Salad", 
      description: "Crisp romaine lettuce, parmesan cheese, croutons and caesar dressing.",
      imagePath: "lib/Images/salads/cesar_salad.jpg", 
      price: 0.99, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 0.99),
        Addon(name: "Anchovies", price: 1.49),
        Addon(name: "Extra Parmesan", price: 1.99),
      ],
    ),
    Food(
      name: "Greek Salad", 
      description: "Tomatoes, cucombers, red onions, olives, feta cheese with olive oil and herbs.",
      imagePath: "lib/Images/salads/greek_salad.jpg", 
      price: 8.99, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Feta Cheese", price: 0.99),
        Addon(name: "Kalamata Olives", price: 1.99),
        Addon(name: "Grilled Shrimp", price: 1.99),
      ],
    ),
    Food(
      name: "Quinoa Salad", 
      description: "Quinoa mixed with cucmbers, tomatoes, bell pepers and a lemon vinaigrette.",
      imagePath: "lib/Images/salads/quinoa_salad.jpeg", 
      price: 9.99, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Avacado", price: 0.99),
        Addon(name: "Feta Cheese", price: 1.49),
        Addon(name: "Grilled Chicken", price: 1.99),
      ],
    ),
    Food(
      name: "Asian Sesame Salad", 
      description: "Delight in the flavours of the east with this sesame-infused salad.",
      imagePath: "lib/Images/salads/asiansesame_salad.jpeg", 
      price: 9.99, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Mandarin Oranges", price: 0.99),
        Addon(name: "Almond Silvers", price: 1.49),
        Addon(name: "Extra Teriyaki Chicken", price: 1.99),
      ],
    ),
    Food(
      name: "South West Chicken Salad", 
      description: "This colorful salad combines the zest flavors of the southwest. Its loaded with mixed vegetables and chicken.",
      imagePath: "lib/Images/salads/southwest_salad.jpg", 
      price: 9.99, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Sour Cream", price: 0.99),
        Addon(name: "Pico de Gallo", price: 1.49),
        Addon(name: "Guacamole", price: 1.99),
      ],
    ),
    
    
    //sides
    Food(
      name: "Sweet Potatos", 
      description: "Crispy sweet potato with a touch of salt.",
      imagePath: "lib/Images/sides/sweet_potatoes.jpg", 
      price: 4.99, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.99),
        Addon(name: "Truffle Oil", price: 1.49),
        Addon(name: "Cajun Spice", price: 1.99),
      ],
    ),
    Food(
      name: "Onion Rings", 
      description: "Golden and crispy onion rings, perfect for dipping.",
      imagePath: "lib/Images/sides/onion_rings.jpeg", 
      price: 3.99, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addon(name: "Ranch Dip", price: 0.99),
        Addon(name: "Spicy Mayo", price: 1.49),
        Addon(name: "Parmesan Dust", price: 1.99),
      ],
    ),
    Food(
      name: "Garlic Bread", 
      description: "Warm and toasty garlic bread, topped with melted butter and parsley.",
      imagePath: "lib/Images/sides/garlicbread_sides.jpg", 
      price: 4.99, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addon(name: "Extra Garlic", price: 0.99),
        Addon(name: "Mozzarella Cheese", price: 1.49),
        Addon(name: "Marinara Dip", price: 1.99),
      ],
    ),
    Food(
      name: "Loades Fries", 
      description: "Savory sweet potato fries loaded with melted cheese, smoky bacon bits and a dollop of sour cream.",
      imagePath: "lib/Images/sides/loadedfries_sides.jpg", 
      price: 4.49, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addon(name: "Sour Cream", price: 0.99),
        Addon(name: "Bacon Bits", price: 1.49),
        Addon(name: "Green Onions", price: 0.99),
      ],
    ),
    Food(
      name: "Crispy Mac and Cheese Bites", 
      description: "Golden brown, bite-sized mac and cheese balls, perfect for on the go snacking.",
      imagePath: "lib/Images/sides/mac_sides.webp", 
      price: 4.49, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addon(name: "Bacon Bits", price: 0.99),
        Addon(name: "Jalapeno Slices", price: 1.49),
        Addon(name: "Siracha Drizzle", price: 0.99),
      ],
    ),
    
    
    //desserts
    Food(
      name: "Cheese Cake", 
      description: "A creamy Cheescake Topped with berry compote and fresh mixed berries on a graham cracker crust.",
      imagePath: "lib/Images/desserts/cheesecake.jpg", 
      price: 5.99, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Whipped Cream", price: 0.99),
        Addon(name: "Extra Berry Compote", price: 1.49),
        Addon(name: "Chocolate Drizzle", price: 0.79),
      ],
    ),
    Food(
      name: "Cookies", 
      description: "Warm, goey chocolate chip cookies with a crispy edge and melty chocolate centre.",
      imagePath: "lib/Images/desserts/cookies.jpg", 
      price: 2.99, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Vanila Icecream", price: 1.49),
        Addon(name: "Extra Chocolate Chips", price: 0.99),
        Addon(name: "Caramel Drizzle", price: 0.79),
      ],
    ),
    Food(
      name: "Sundae", 
      description: "An indulgent icecream sundae piled high with multiple scoops, colorful swirls, chocolate sauce, waffle cones and fresh starwberries.",
      imagePath: "lib/Images/desserts/sundae.jpg", 
      price: 4.99, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Extra Chocolate Sauce", price: 0.99),
        Addon(name: "Raimbow Sprinkles", price: 0.49),
        Addon(name: "Fresh Strawberries", price: 1.29),
      ],
    ),
    Food(
      name: "Tarts", 
      description: "Buttery mini tarts filled with creamy custard and topped with assorment of fresh colorful fruits.",
      imagePath: "lib/Images/desserts/tarts.jpg", 
      price: 2.99, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Extra Custard Cream", price: 0.99),
        Addon(name: "Powdered Sugar Dusting", price: 0.49),
        Addon(name: "Mixed Berries", price: 1.29),
      ],
    ),
    Food(
      name: "Tiramisu", 
      description: "Classic italian tiramisu with layers of espresso soaked ladyfingers, mascarpone cream, cocoa dusting and chocolate drizzle.",
      imagePath: "lib/Images/desserts/tiramisu.jpg", 
      price: 3.99, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Extra Cocoa Dusting", price: 0.49),
        Addon(name: "Chocolate Shavings", price: 0.99),
        Addon(name: "Espresso Shot", price: 1.49),
      ],
    ),

    //drinks
    Food(
      name: "Iced Coffee", 
      description: "A bold iced coffee topped with creamy whipped foam and swirls of rich caramel sauce.",
      imagePath: "lib/Images/drinks/iced_coffee.jpeg", 
      price: 2.99, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Caramel Swirl", price: 0.79),
        Addon(name: "Vanilla Syrup", price: 0.99),
        Addon(name: "Extra Espresso Shot", price: 1.49),
      ],
    ),
    Food(
      name: "Hot Chocolate", 
      description: "Rich and streamy hot chocolate topped with marshmellows and a decadent chocolate drizzle.",
      imagePath: "lib/Images/drinks/hot_chocolate.jpg", 
      price: 2.99, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Extra Marshmellows", price: 0.99),
        Addon(name: "Whipped Cream", price: 0.99),
        Addon(name: "Cinnamon Sprinkle", price: 0.49),
      ],
    ),
    Food(
      name: "Lemon Soda", 
      description: "A refreshing frizzy lemon soda with a perfect balance of sweet and tangy citrus flavors.",
      imagePath: "lib/Images/drinks/lemon_soda.webp", 
      price: 1.99, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Extra Lemon Slices", price: 0.99),
        Addon(name: "Mint Leaves", price: 0.49),
        Addon(name: "Salted Rim", price: 0.29),
      ],
    ),
    Food(
      name: "Orange Juice", 
      description: "Freshly squeezed orange juice bursting with a natural sweetness and vibrant citrys flavor.",
      imagePath: "lib/Images/drinks/orange_juice.jpeg", 
      price: 1.99, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Extra Pulp", price: 0.49),
        Addon(name: "Ginger Shot", price: 0.99),
        Addon(name: "Honey Drizzle", price: 0.79),
      ],
    ),
    Food(
      name: "Pineapple Juice", 
      description: "Tropical and refreshing pineapple juice with a sweet tangy flavor and smooth finish.",
      imagePath: "lib/Images/drinks/pineapple_juice.jpeg", 
      price: 3.99, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Coconut Cream", price: 0.99),
        Addon(name: "Fresh Mint", price: 0.49),
        Addon(name: "Chill Salt Rim", price: 0.29),
      ],
    ),

  ];
  
  //user cart
 final List<CartItem> _cart = [];

 //delivery address which user can change
 String _deliveryAddress = 'Malir Cantt Askari 5';
  /*
  G E T T E R S
  

  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress; 

  /*

  O P E R A T I O N S

  */

 

 // add to cart
 void addToCart(Food food, List<Addon> selectedAddons){
  //see if there is a cart item already wuth the same food and selected addpns
  CartItem? cartItem = _cart.firstWhereOrNull((item){
    //check if the food items are the same
    bool isSameFood = item.food == food;

    //check if the selected addons are the same
    bool isSameAddons = 
    ListEquality().equals(item.selectedAddons, selectedAddons);
   return isSameFood && isSameAddons;
  });

  //is item alr exists, increase its quantity
  if (cartItem != null){
    cartItem.quantity++;
  }

  //otherwise add a new cart item to the cart
  else {
    _cart.add(
      CartItem(food: food, selectedAddons: selectedAddons,
      ),
    );
  }
  notifyListeners();
 }
 //remove from cart
 void removeFromCart(CartItem cartItem) {
  int cartIndex = _cart.indexOf(cartItem);

  if (cartItem != -1){
    if (_cart[cartIndex].quantity > 1){
      _cart[cartIndex].quantity--;
    } else {
      _cart.removeAt(cartIndex);
    }
  } 
  notifyListeners();
 }
 //get toal price of cart
 double getTotalPrice() {
  double total = 0.0;

  for (CartItem cartItem in _cart) {
    double itemTotal = cartItem.food.price;

    for (Addon addon in cartItem.selectedAddons){
      itemTotal += addon.price;
    }
      
      total += itemTotal * cartItem.quantity;
 }
 return total;
}
 // get total number of items in cart
 int getTotalItemCount(){
  int totalItemCount = 0;


  for (CartItem cartItem in _cart){
    totalItemCount += cartItem.quantity;
  }
  return totalItemCount;
 }
 //clear cart
 void clearCart(){
  _cart.clear();
  notifyListeners();
 }
 
 //update delivery address
 void updateDeliveryAddress(String newAddress){
  _deliveryAddress = newAddress;
  notifyListeners();
 }
  /* 
  H E L P E R S
  */

  //generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate = 
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

        receipt.writeln(formattedDate);
        receipt.writeln();
        receipt.writeln("----------");

        for (final cartItem in _cart){
          receipt.writeln(
            "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}"
          );
          if (cartItem.selectedAddons.isNotEmpty){
            receipt
               .writeln("   Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
          }
          receipt.writeln();
        }
        receipt.writeln("---------");
        receipt.writeln();
        receipt.writeln("Total Items: ${getTotalItemCount()}");
        receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
        receipt.writeln();
        receipt.writeln("Delivering to: $deliveryAddress");

        return receipt.toString();

  }
  //format double value into money
  String _formatPrice(double price){
    return "\$${price.toStringAsFixed(2)}";
  }
  //format list of addons into string summary
  String _formatAddons(List<Addon> addons) {
    return addons
    .map((addon) => "${addon.name} (${_formatPrice(addon.price)}) ")
    .join(", ");
  }
  
}