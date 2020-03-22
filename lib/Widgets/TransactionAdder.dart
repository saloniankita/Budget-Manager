import 'package:flutter/material.dart';

class TransactionAdder extends StatefulWidget {
  final Function newTxAdder;

  TransactionAdder(this.newTxAdder);

  @override
  _TransactionAdderState createState() => _TransactionAdderState();
}

class _TransactionAdderState extends State<TransactionAdder> {
  final titleInput = TextEditingController();

  final amountInput = TextEditingController();

  void submitData()
  {
    final title = titleInput.text;
    final amount = double.parse(amountInput.text);
    
    if(title.isEmpty || amount <= 0)
    return;

    widget.newTxAdder(title,amount);

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
            controller: titleInput,
            onSubmitted: (_) => submitData(),          
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountInput,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          FlatButton(
            child: Text('Add Transaction'),
            textColor: Colors.deepPurple,
            onPressed: submitData,
          ),
        ],
      )),
    );
  }
}
