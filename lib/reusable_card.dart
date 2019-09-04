import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;

  ReusableCard({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      height: 200.0,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
