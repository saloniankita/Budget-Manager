import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionAdder extends StatefulWidget {
  final Function newTxAdder;

  TransactionAdder(this.newTxAdder);

  @override
  _TransactionAdderState createState() => _TransactionAdderState();
}

class _TransactionAdderState extends State<TransactionAdder> {
  final _titleInput = TextEditingController();
  final _amountInput = TextEditingController();
  DateTime _selectedDate;

  void _presenttDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _submitData() {
    final title = _titleInput.text;
    final amount = double.parse(_amountInput.text);

    if (title.isEmpty || amount <= 0 || _selectedDate == null) return;

    widget.newTxAdder(title, amount,_selectedDate);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleInput,
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: _amountInput,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData(),
          ),
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(_selectedDate == null
                        ? 'No date chosen mofo'
                        : 'Picked Date:${DateFormat.yMd().format(_selectedDate)}')),
                RaisedButton(
                  textColor: Theme.of(context).primaryColor,
                  color: Theme.of(context).textTheme.button.color,
                  elevation: 5,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: _presenttDatePicker,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textColor: Theme.of(context).primaryColor,
                color: Theme.of(context).textTheme.button.color,
                elevation: 5,
                onPressed: _submitData,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
