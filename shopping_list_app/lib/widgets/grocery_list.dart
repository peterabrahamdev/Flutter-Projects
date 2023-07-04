import 'package:flutter/material.dart';
import 'package:shopping_list_app/models/grocery_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key, required this.groceryItems});

  final List<GroceryItem> groceryItems;

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _removeItem(GroceryItem groceryItem) {
    final itemIndex = widget.groceryItems.indexOf(groceryItem);
    setState(() {
      widget.groceryItems.remove(groceryItem);
    });
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Item deleted.'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            widget.groceryItems.insert(itemIndex, groceryItem);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.groceryItems.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          key: ValueKey(widget.groceryItems[index]),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            _removeItem(widget.groceryItems[index]);
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
