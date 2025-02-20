import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/navbar/bottom_navbar_provider.dart';

class NavbarScreen extends StatelessWidget {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navbarProvider = Provider.of<BottomNavProvider>(context);
    return Scaffold(
      body: navbarProvider.items[navbarProvider.currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: navbarProvider.currentIndex,
          onTap: (index) {
            navbarProvider.currentIndex = index;
          },
          items: navbarProvider.items
              .map((items) => BottomNavigationBarItem(
                  icon: Icon(items.iconData), label: items.labelName))
              .toList()),
    );
  }
}
