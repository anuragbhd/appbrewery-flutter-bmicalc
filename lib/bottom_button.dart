import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Function onTap;

  BottomButton({@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBottomBarColor,
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(bottom: 20.0),
      width: double.infinity,
      height: kBottomBarHeight,
      child: GestureDetector(
        child: Center(
          child: Text(
            this.title,
            style: kBottomBarTextStyle,
          ),
        ),
        onTap: this.onTap,
      ),
    );
  }
}
