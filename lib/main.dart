import 'package:flutter/material.dart';

import './Widgets/Transactions_Card_List.dart';
import './Widgets/TransactionAdder.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Planner',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
                      title: Text('Budget Planner'),centerTitle: true,),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(
            child:Text('CHART!'),
            color: Colors.blue,
            elevation: 5,
          ),
        ),
        TransactionAdder(),//This will add the transaction to the list
        NewCards(),//Display the List of Transactions
           ],
      ),
    );
  }
}