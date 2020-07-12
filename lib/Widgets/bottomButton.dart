import 'package:flutter/material.dart';

import '../const.dart';

class BottomButton extends StatelessWidget {

  final Function onTap;
  final String buttonText;

  const BottomButton( this.onTap, this.buttonText);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        color: Color(0xFFEB1555),
        child:Center(child: Text(buttonText,style:kLargeButtonTextStyle),),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}