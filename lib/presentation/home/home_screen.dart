import 'package:flutter/material.dart';
import 'package:restaurant_app/presentation/home/list_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Resto", style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const ListCard(),
    );
  }
}
