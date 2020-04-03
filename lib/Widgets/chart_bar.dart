import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentage;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentage);

  static final Runes input = new Runes('\u{20B9}');
  final String rupeeSymbol = String.fromCharCodes(input);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                  child: Text(rupeeSymbol + spendingAmount.toStringAsFixed(0))),
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 15,
              margin:
                  EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.05),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPercentage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                child: Text(label),
            ),
          ],
        );
      },
    );
  }
}
