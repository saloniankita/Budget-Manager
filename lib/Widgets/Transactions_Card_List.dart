import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Transaction.dart';

class NewCards extends StatelessWidget {
  
  final List<Transaction> transactionObject;
  NewCards(this.transactionObject);
  
  static final Runes input = new Runes(' \u{20B9}'); //these two lines add rupees symbol in the 
  final String rupeeSymbol= String.fromCharCodes(input);// output code.


  @override
  Widget build(BuildContext context) {
   
    return Container(
      height: 400,
      child: ListView.builder(
         itemBuilder: (ctx,index) {
           return Card(
                      child:Row(
                          children: <Widget>[
                  Container( child: Text('$rupeeSymbol${transactionObject[index].amount.toStringAsFixed(2)}', //Amount should be inserted here.
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
                child: Text(transactionObject[index].title,//title should be punched here
                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                            ),
                        ),

              ),//container for the title ends here
              
              Container(
                child: Text(DateFormat.yMMMd().format(transactionObject[index].date),//Date should be punched here
                            style: TextStyle(color: Colors.grey),),
                ), //container for date
            ], 
          ),
          ],
          ),
        ); //Card is returned
         },
         itemCount: transactionObject.length,
      ),
    );//Column is returend 
  } //Build Widget method is closed Here
}//new Card State Class is closed 
