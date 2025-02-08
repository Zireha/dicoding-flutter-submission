import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String name;
  const MenuCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container( // Hapus Expanded
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/images/food_drink_icon.png',
              width: 60,
              height: 70,
            ),
          ),
          Center(
            child: Text(
              name,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
