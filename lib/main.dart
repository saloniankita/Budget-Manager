import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';
import './Cards.dart';
import 'TransactionAdder.dart';

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
  final List<Transaction> transaction =[
    Transaction(id: '1', title: 'New Shoes', amount: 29.99, date: DateTime.now() ),
    Transaction(id: '2', title: 'Extra New Shoes', amount: 19.99, date: DateTime.now() ),
  ];
  
  
  
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
        TransactionAdder(),//This will add the transaction to thee list
        Column(children: transaction.map((tx) {
          return NewCards(amount :tx.amount.toString(), title:tx.title,date: DateFormat.yMMMd().format(tx.date));
        }).toList(),)
      ],
      ),
    );
  }
}