import 'package:flutter/material.dart';

import './Widgets/Transactions_Card_List.dart';
import './Widgets/TransactionAdder.dart';
import './Models/Transaction.dart';
import './Widgets/charts.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Planner',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
          title:TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            ),
          ),
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'QuickSand',
            fontFamilyFallback: ['OpenSans'],
            fontSize: 20,
          )
        ),
        ),      
      ),
      
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
     

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final List<Transaction> _transactionObject = [
    // Transaction(
    //     id: '1', title: 'New Shoes', amount: 29.99, date: DateTime.now()),
    // Transaction(
    //     id: '2', title: 'Extra New Shoes', amount: 19.99, date: DateTime.now()),
  ]; //Transaction Model with dummy data and it will also hold new transactions.

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString()
        );
   
    setState(() {
          _transactionObject.add(newTx);   
    });
  
  }


  void _starttx(BuildContext ctx)
  {
    showModalBottomSheet(context: ctx, builder: (_) {
       return GestureDetector(
         child: TransactionAdder(_addNewTransaction),
         onTap: () {},
         behavior: HitTestBehavior.opaque,
         ); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
                      title: Text('Budget Planner'),centerTitle: true,
                      actions: <Widget> 
                      [
                        IconButton(icon: Icon(Icons.add),onPressed:()=> _starttx(context),)
                      ]
                      ),
                      
      body: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            Container(
              width: double.infinity,
              child: Charts(_transactionObject),
            ),
            //TransactionAdder(_addNewTransaction), //This will add the transaction to the list
            NewCards(_transactionObject), //Display the List of Transactions],
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add) ,onPressed:()=> _starttx(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}