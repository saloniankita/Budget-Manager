import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text('Budget Planner'),),
      body: Column(children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(
            child:Text('CHART!'),
            color: Colors.blue,
            elevation: 5,
          ),
        ),
        Card(
          child: Text('List of TX'),
        ),
      ],
      ),
    );
  }
}