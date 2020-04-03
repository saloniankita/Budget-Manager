import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './Widgets/Transactions_Card_List.dart';
import './Widgets/TransactionAdder.dart';
import './Models/Transaction.dart';
import './Widgets/charts.dart';

void main()
{
   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp,]);
   runApp(MyApp());
  }

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
          button: TextStyle(
            color:Colors.white,
          )  
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

final List<Transaction> _transactionObject = []; //Transaction Model with dummy data and it will also hold new transactions.

  void _addNewTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: txDate,
        id: DateTime.now().toString()
        );
   
    setState(() {
          _transactionObject.add(newTx);   
    });
  
  }

  void _delTransaction(String id)
  {
    setState(() {
      _transactionObject.removeWhere((tx)=> tx.id == id);
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
    final appBar = AppBar( 
                      title: Text('Budget Planner'),centerTitle: true,
                      actions: <Widget> 
                      [
                        IconButton(icon: Icon(Icons.add),onPressed:()=> _starttx(context),)
                      ]
                      );
    
     final mediaQuery =MediaQuery.of(context);
     final widgetHeight =mediaQuery.size.height - mediaQuery.padding.top -appBar.preferredSize.height; 


    return Scaffold(
      appBar: appBar,
                      
      body: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: widgetHeight *0.3,
                  width: double.infinity,
                  child: Charts(_transactionObject),
                  ),
                Container(
                  height: widgetHeight *0.7,
                  child: NewCards(_transactionObject,_delTransaction,appBar)
                  ), //Display the List of Transactions],
              ],
          ),
      ),
      floatingActionButton: Platform.isIOS ?Container(): FloatingActionButton(
        child: Icon(Icons.add) ,onPressed:()=> _starttx(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}