class Menus {
  final List<MenuItem> foods;
  final List<MenuItem> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromMap(Map<String, dynamic> map) {
    return Menus(
      foods: List<MenuItem>.from(map['foods'].map((x) => MenuItem.fromMap(x))),
      drinks:
      List<MenuItem>.from(map['drinks'].map((x) => MenuItem.fromMap(x))),
    );
  }
}

class MenuItem {
  final String name;

  MenuItem({required this.name});

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      name: map['name'],
    );
  }
}