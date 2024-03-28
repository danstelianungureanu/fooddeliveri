import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveri/models/cart_item.dart';
import 'package:fooddeliveri/models/food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu

  final List<Food> _menu = [
    //burgers
    Food(
      name: 'Classic Cheeseburger',
      description:
          'A juicy patty with melted cheddar, lettuce, tomato and a hint of onion and pickle.',
      imagePath: 'lib/images/burgers/beef_burger.png',
      price: 0.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
        Addon(name: 'Avocado', price: 2.99),
      ],
    ),
    Food(
      name: 'Classic Cheeseburger',
      description:
          'A juicy patty with melted cheddar, lettuce, tomato and a hint of onion and pickle.',
      imagePath: 'lib/images/burgers/beef_burger.png',
      price: 0.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
        Addon(name: 'Avocado', price: 2.99),
      ],
    ),
    Food(
      name: 'Classic Cheeseburger',
      description:
          'A juicy patty with melted cheddar, lettuce, tomato and a hint of onion and pickle.',
      imagePath: 'lib/images/burgers/beef_burger.png',
      price: 0.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
        Addon(name: 'Avocado', price: 2.99),
      ],
    ),
    Food(
      name: 'Classic Cheeseburger',
      description:
          'A juicy patty with melted cheddar, lettuce, tomato and a hint of onion and pickle.',
      imagePath: 'lib/images/burgers/beef_burger.png',
      price: 0.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
        Addon(name: 'Avocado', price: 2.99),
      ],
    ),
    //salads
    Food(
      name: 'Classic Cheeseburger',
      description:
          'A juicy patty with melted cheddar, lettuce, tomato and a hint of onion and pickle.',
      imagePath: 'lib/images/burgers/beef_burger.png',
      price: 0.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
        Addon(name: 'Avocado', price: 2.99),
      ],
    ),
    //sides

    //desserts

    //drinks
  ];

  /*
    GETTERS
  */
  List<Food> get menu => _menu;
  /*
    OPERATIONS

    */
  // user Cart
  final List<CartItem> _cart = [];
// add to the cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;
      // check if the list of selected addons are the same

      bool isSameAddon =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddon;
    });
    // if item already exists. increase it's quantity

    if (cartItem != null) {
      cartItem.quantity++;
    }
    // otherwise , add a new cart item
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      // }
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
    HELPERS
// generate a receipt

// foermat double value into money

// format list af addon into a string summary



  */
}
