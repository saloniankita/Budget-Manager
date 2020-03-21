import 'package:flutter/material.dart';
//import 'package:unicode/unicode.dart';

class NewCards extends StatefulWidget {
  final String amount, date, title;
  static final Runes input = new Runes(' \u{20B9}'); 

  NewCards({this.amount, this.date, this.title});

  @override
  _NewCardsState createState() => _NewCardsState();
}

class _NewCardsState extends State<NewCards> {
  final String rupeeSymbol= String.fromCharCodes(NewCards.input);

  @override
  Widget build(BuildContext context) {
    return Card(
        child:Row(children: <Widget>[
        Container(
          child: 
                Text('$rupeeSymbol${widget.amount}',
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
              child: Text(
                          //title
                          widget.title,
                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                          ),
                      ),

            ),//container for the title ends here
            Container(
              child: Text(widget.date,
                          style: TextStyle(color: Colors.grey),),
              ), //container for date
          ], 
        ),
        ],
        ),
    );//Card is returned
  }
}
