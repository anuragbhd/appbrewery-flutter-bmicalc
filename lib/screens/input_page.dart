import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/gender.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onTap: () => this.setState(() {
                        this.selectedGender = Gender.male;
                      }),
                      color: this.selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        content: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTap: () => this.setState(() {
                        this.selectedGender = Gender.female;
                      }),
                      color: this.selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        content: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kContentTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          this.height.toString(),
                          style: kBigTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kContentTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      child: Slider(
                        value: this.height.toDouble(),
                        min: kMinHeight,
                        max: kMaxHeight,
                        onChanged: (double newValue) => this.setState(() {
                          this.height = newValue.round();
                        }),
                      ),
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kSliderActiveTrackColor,
                        inactiveTrackColor: kSliderInactiveTrackColor,
                        thumbColor: kSliderThumbColor,
                        overlayColor: kSliderOverlayColor,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kContentTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kBigTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () => this.setState(() {
                                  this.weight -= 1;
                                }),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () => this.setState(() {
                                  this.weight += 1;
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kContentTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kBigTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () => this.setState(() {
                                  this.age -= 1;
                                }),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () => this.setState(() {
                                  this.age += 1;
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
                title: 'CALCULATE',
                onTap: () {
                  CalculatorBrain calc = CalculatorBrain(
                    height: this.height,
                    weight: this.weight,
                  );
                  Navigator.pushNamed(
                    context,
                    '/results',
                    arguments: <String, String>{
                      'bmi': calc.calculateBMI(),
                      'result': calc.getResult(),
                      'interpretation': calc.getInterpretation(),
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
