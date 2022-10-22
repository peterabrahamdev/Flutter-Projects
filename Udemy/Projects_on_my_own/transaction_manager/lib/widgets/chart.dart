import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get _groupedTransactionValues {
    return List.generate(7, (index)  {
      var weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for(var i = 0; i<recentTransactions.length; i++){
        if(recentTransactions[index].date.day == weekDay.day 
        && recentTransactions[index].date.month == weekDay.month 
        && recentTransactions[index].date.year == weekDay.year ){
          totalSum += recentTransactions[index].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }


  List<Transaction> _pastWeekDatas() {
    var recentlySpent = [];
    recentTransactions.map((tx) {
      if (tx.date.day >= DateTime.now().day) {
        recentlySpent.add(tx);
      }
    }).toList();
  }

  double _calculateSpentPercentageOfDay() {
    var weeklyAmount = 0.0;
    recentTransactions.map((tx) {
      weeklyAmount += tx.amount;
    }).toList();

    return weeklyAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 10,
        shadowColor: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        margin: EdgeInsets.all(10),
        child: Row(
          children: _groupedTransactionValues.map((e) => null).toList(),
        ),
      ),
    );
  }
}
