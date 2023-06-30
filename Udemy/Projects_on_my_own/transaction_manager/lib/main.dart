import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';

import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.pink,
              secondary: Colors.redAccent,
              tertiary: Colors.deepOrange[100]
            ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      DateTime.now().toString(),
      'New Shoes',
      69.99,
      DateTime.now(),
    ),
    Transaction(
      DateTime.now().toString(),
      'New Shoes',
      69.99,
      DateTime.now(),
    ),
    
  ];

  void _addNewTransaction(String label, double amount, DateTime selectedDate) {
    final newTx = Transaction(
      DateTime.now().toString(),
      label,
      amount,
      selectedDate,
    );
    setState(() {
      _userTransactions.add(newTx);
    });

    print(_userTransactions);
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text('Personal Expenses'),
      actions: [
        IconButton(
            onPressed: () {
              _startAddNewTransaction(context);
            },
            icon: Icon(Icons.add))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.3,
              child: Chart(_userTransactions),
            ),
            Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: TransactionList(_userTransactions),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTransaction(context);
          print(_userTransactions);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
