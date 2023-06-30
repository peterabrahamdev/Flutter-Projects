import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;

  TransactionList(
    this.transactions,
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(8),
            elevation: 10,
            shadowColor: Colors.grey[100],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: FittedBox(child: Text('\$${transactions[index].amount}')),
                ),
                backgroundColor: Theme.of(context).colorScheme.tertiary,
              ),
              title: Text(transactions[index].label),
              subtitle: Text(
                DateFormat('yyyy.MM.dd.').format(transactions[index].date),
              ),
            ),
          );
      },
    );
  }
}
