import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double amountSpent;
  final DateTime dateSpent;
  final double pctOfMax;

  ChartBar(
    this.amountSpent,
    this.dateSpent,
    this.pctOfMax,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            Text('\$60'),
            Container(
              padding: EdgeInsets.all(20),
              height: constraints.maxHeight * 0.7,
              width: 15,
              decoration: BoxDecoration(
                border:
                    Border.all(style: BorderStyle.solid, color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: Stack(
                children: [
                  FractionallySizedBox(
                    heightFactor: pctOfMax,
                    child: Container(
                      width: 15,
                      decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text('S'),
          ],
        );
      },
    );
  }
}
