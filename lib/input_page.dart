import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'gender.dart';

const ACTIVE_CARD_COLOR = Color(0xFF1D1E33);
const INACTIVE_CARD_COLOR = Color(0xFF111328);
const BOTTOM_BAR_HEIGHT = 80.0;
const BOTTOM_BAR_COLOR = Color(0xFFEA1556);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

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
                    child: GestureDetector(
                      onTap: () => this.setState(() {
                        this.selectedGender = Gender.male;
                      }),
                      child: ReusableCard(
                        color: this.selectedGender == Gender.male
                            ? ACTIVE_CARD_COLOR
                            : INACTIVE_CARD_COLOR,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          content: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => this.setState(() {
                        this.selectedGender = Gender.female;
                      }),
                      child: ReusableCard(
                        color: this.selectedGender == Gender.female
                            ? ACTIVE_CARD_COLOR
                            : INACTIVE_CARD_COLOR,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          content: 'FEMALE',
                        ),
                      ),
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
