import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Transaction.dart';

class NewCards extends StatefulWidget {
  
  @override
  _NewCardsState createState() => _NewCardsState();
}

class _NewCardsState extends State<NewCards> {
  
  static final Runes input = new Runes(' \u{20B9}'); //these two lines add rupees symbol in the 
  final String rupeeSymbol= String.fromCharCodes(input);// output code.

  final List<Transaction> _transactionObject=[
    Transaction(id: '1', title: 'New Shoes', amount: 29.99, date: DateTime.now() ),
    Transaction(id: '2', title: 'Extra New Shoes', amount: 19.99, date: DateTime.now() ),
  ]; //Transaction Model with dummy data and it will also hold new transactions.

  @override
  Widget build(BuildContext context) {
   
    return Column(
      children: _transactionObject.map((tx) 
              { return Card(
                    child:Row(
                        children: <Widget>[
                Container( child: Text('$rupeeSymbol${tx.amount.toString()}', //Amount should be inserted here.
                     style:
                           TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 22,
                             color: Colors.purple,
                             ),
                     textAlign: TextAlign.center,
                             ),
                margin: EdgeInsets.symmetric(horizontal:15.0 ,vertical: 10.0 ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration( 
                  border:Border.all(color: Colors.purple,width: 2.0),
                ),
        ),//Container for the amount
        
        
        Column( //Column for the title and date
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: <Widget>[
            Container(
              child: Text(tx.title,//title should be punched here
                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                          ),
                      ),

            ),//container for the title ends here
            
            Container(
              child: Text(DateFormat.yMMMd().format(tx.date),//Date should be punched here
                          style: TextStyle(color: Colors.grey),),
              ), //container for date
          ], 
        ),
        ],
        ),
      ); //Card is returned
       }//Arrow function is closed
      ).toList(), //map is closing here
    );//Column is returend 
  } //Build Widget method is closed Here
}//new Card State Class is closed 
