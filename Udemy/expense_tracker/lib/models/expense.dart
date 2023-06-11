import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  }) : id = uuid.v4();
  // Here we can use the Initializer List for the variable id.
  // It helps initialize class properties that are not recieved as constructor function arguments.

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
