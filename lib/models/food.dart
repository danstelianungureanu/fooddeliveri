// ignore_for_file: constant_identifier_names

class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<Addon> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

// food categories
enum FoodCategory {
  Burgers,
  Salads,
  Sides,
  Drinks,
  Desserts,
}

// food addon

class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
