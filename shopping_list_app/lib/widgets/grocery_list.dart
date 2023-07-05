import 'package:flutter/material.dart';

import 'package:shopping_list_app/models/grocery_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList(
      {super.key, required this.groceryItems, required this.removeItem});

  final List<GroceryItem> groceryItems;
  final void Function(GroceryItem) removeItem;

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.groceryItems.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          key: ValueKey(widget.groceryItems[index]),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            widget.removeItem(widget.groceryItems[index]);
          },
          background: Container(
            color: Theme.of(context).colorScheme.error,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          ),
          child: ListTile(
            leading: Container(
              height: 24,
              width: 24,
              color: widget.groceryItems[index].category.color,
            ),
            title: Text(widget.groceryItems[index].name),
            trailing: Text(widget.groceryItems[index].quantity.toString()),
          ),
        );
      },
    );
  }
}
