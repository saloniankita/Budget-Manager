import 'package:flutter/material.dart';

class TransactionAdder extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Card(
            child: Container
              (child: Column(
                children: <Widget>[
                  TextField(),
                  TextField(),],
        )
      ),
    );
  }
}