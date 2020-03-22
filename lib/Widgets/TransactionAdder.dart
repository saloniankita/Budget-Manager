import 'package:flutter/material.dart';

class TransactionAdder extends StatelessWidget {
  TransactionAdder();
  final titleInput = TextEditingController(); 
  final amountInput =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
            child: Container
              (child: Column(
                children: <Widget>[
                  TextField(decoration: InputDecoration(labelText: 'Title'),controller: titleInput,),
                  TextField(decoration: InputDecoration(labelText: 'Amount'),controller: amountInput,),
                  FlatButton(child: Text('Add Transaction'),textColor: Colors.deepPurple,onPressed: () => Null,),
                  ],
        )
      ),
    );
  }
}