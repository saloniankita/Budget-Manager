import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Transaction.dart';

class NewCards extends StatelessWidget {
  final List<Transaction> transactionObject;
  final Function delTransaction;
  NewCards(this.transactionObject,this.delTransaction);

  static final Runes input =
      new Runes('\u{20B9}'); //these two lines add rupees symbol in the
  final String rupeeSymbol = String.fromCharCodes(input); // output code.

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactionObject.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'Nothing add as of now',
                  style: Theme.of(context).textTheme.title,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    height: 400,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '$rupeeSymbol${transactionObject[index].amount.toStringAsFixed(2)}', //Amount should be inserted here.
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Theme.of(context).primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2.0),
                        ),
                      ), //Container for the amount

                      Expanded(
                        child: Column(
                          //Column for the title and date
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: <Widget>[
                            Container(
                              child: Text(
                                transactionObject[index].title, //title should be punched here
                                style: Theme.of(context).textTheme.title, //Global styling
                              ),
                            ), //container for the title ends here

                            Container(
                              child: Text(
                                DateFormat.yMMMd().format(
                                    transactionObject[index].date), //Date should be punched here
                                style: TextStyle(color: Colors.grey),
                              ),
                            ), //container for date
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: ()=>delTransaction(transactionObject[index].id),
                          color: Theme.of(context).errorColor,
                        ),
                      )
                    ],
                  ),
                ); //Card is returned
              },
              itemCount: transactionObject.length,
            ),
    ); //Column is returend
  } //Build Widget method is closed Here
} //new Card State Class is closed
