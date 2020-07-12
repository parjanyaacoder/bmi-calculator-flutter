import 'package:bmi_calculator/Widgets/MainWidget.dart';
import 'package:bmi_calculator/Widgets/bottomButton.dart';
import 'package:bmi_calculator/const.dart';
import 'Widgets/bottomButton.dart';

import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultsPage({Key key, this.bmiResult, this.resultText, this.interpretation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
       title: Text('Hello'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
             child: Container(
               padding: EdgeInsets.all(15.0),
               child: Text('Your Result',style: kTitleTextStyle,),
             ),
          ),
          Expanded(
            flex: 5,
            child: MainWidget(
              kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),style: kResultTextStyle,),
                  Text(bmiResult,style: kBMITextStyle,),
                  Text( interpretation,style: kBodyTextStyle,textAlign: TextAlign.center,),

                ],
              ),

            ),
          ),
         BottomButton(()
         {Navigator.pop(context);
         },
             "RE-CALCULATE"),

        ],
      ),
    );
  }
}
