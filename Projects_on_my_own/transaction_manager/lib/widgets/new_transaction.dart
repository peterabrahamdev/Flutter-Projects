import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    void _submitData() {
      final titleData = _titleController.text;
      final amountData = double.parse(_amountController.text);

      if (titleData.isEmpty || amountData <= 0 || _selectedDate == null) {
        return;
      } else {
        widget.addTransaction(titleData, amountData, _selectedDate);
      }

      Navigator.pop(context);
    }

    void _selectDate() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
      ).then((chosenDate) {
        if(chosenDate == null)
          return;
        setState(() {
          _selectedDate = chosenDate;
        });
      });
    }

    return Container(
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(label: Text('Title')),
                controller: _titleController,
                onSubmitted: (_) => _submitData,
              ),
              TextField(
                decoration: InputDecoration(label: Text('Amount')),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData,
              ),
              Row(
                children: [
                  Text('No date chosen!'),
                  TextButton(
                    onPressed: _selectDate,
                    child: Text('Choose date'),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 0,
                ),
                child: ElevatedButton(
                  onPressed: _submitData,
                  child: Text('Add transaction'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
