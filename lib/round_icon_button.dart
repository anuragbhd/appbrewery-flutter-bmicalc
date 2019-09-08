import 'package:flutter/material.dart';
import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({@required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(this.icon),
      elevation: 0.0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      fillColor: kRoundButtonColor,
      onPressed: this.onPressed,
    );
  }
}
