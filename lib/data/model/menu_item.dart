class MenuItem {
  final String name;

  MenuItem({required this.name});

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name};
  }
}