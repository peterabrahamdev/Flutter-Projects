import 'package:flutter/material.dart';

import 'package:expense_tracker/widget/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Expenses(),
    ),
  );
}