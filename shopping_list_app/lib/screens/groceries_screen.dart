import 'package:flutter/material.dart';
import 'package:shopping_list_app/widgets/grocery_list.dart';

class GroceriesScreen extends StatelessWidget {
  const GroceriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your groceries')),
      body: const GroceryList(),
    );
  }
}
