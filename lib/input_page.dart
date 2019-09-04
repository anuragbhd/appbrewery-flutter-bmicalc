import 'package:flutter/material.dart';
import 'reusable_card.dart';

const ACTIVE_CARD_COLOR = Color(0xFF1D1E33);
const BOTTOM_BAR_HEIGHT = 80.0;
const BOTTOM_BAR_COLOR = Color(0xFFEA1556);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: ACTIVE_CARD_COLOR,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: ACTIVE_CARD_COLOR,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: ACTIVE_CARD_COLOR,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: ACTIVE_CARD_COLOR,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: ACTIVE_CARD_COLOR,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: BOTTOM_BAR_COLOR,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: BOTTOM_BAR_HEIGHT,
            ),
          ],
        ),
      ),
    );
  }
}
