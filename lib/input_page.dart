
import 'package:bmi_calculator/Widgets/cardItems.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Widgets/MainWidget.dart';
import 'Widgets/RoundIconButton.dart';
import 'Widgets/bottomButton.dart';
import 'const.dart';


enum GenderType{
  male,female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  GenderType gender = GenderType.male;
  int height = 180;
  int weight = 60;
  int age=18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MainWidget(gender==GenderType.male?kActiveCardColor:kInactiveCardColor,
                  cardChild: cardItems(FontAwesomeIcons.mars,'MALE'),
                    onPress: (){setState(() {
                      gender = GenderType.male;
                    });},
                  ),
                ),
                Expanded(
                  child: MainWidget(gender==GenderType.female?kActiveCardColor:kInactiveCardColor,
                    cardChild: cardItems(FontAwesomeIcons.venus,'FEMALE'),
                    onPress: (){setState(() {
                      gender = GenderType.female;
                    });},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(children: <Widget>[

              Expanded(
                child: MainWidget(kActiveCardColor,
                cardChild:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text(
                           'HEIGHT',
                           style: kLabelTextStyle,
                         ),

                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.baseline,
                           textBaseline:TextBaseline.alphabetic,
                           children: <Widget>[
                             Text(height.toString(),style: kNumberTextStyle),
                             Text(
                               'cm',style: kLabelTextStyle,
                             )
                           ],
                         ),
                         SliderTheme(
                           data: SliderTheme.of(context).copyWith(
                             thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                             overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                             activeTrackColor: Colors.white,
                             inactiveTrackColor: Color(0xFF8D8E98),
                             overlayColor : Color(0x29EB1555),
                           ),
                           child: Slider(
                             value: height.toDouble(),
                             min: 120.0,
                             max:220.0,


                             onChanged: (double newValue) {
                               setState(() {
                                 height=newValue.toInt();
                               });
                           },

                           ),
                         ),
                       ],
                    ),
                ),
              ),
    ],),
          ),
    Expanded(
    child: Row(children: <Widget>[
            Expanded(
              child: MainWidget(kActiveCardColor,
                cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT',style: kLabelTextStyle,),
                    Text(weight.toString(),style:kNumberTextStyle),
                   Row( 
                     mainAxisAlignment: MainAxisAlignment.center,
                     children:<Widget>[
                       RoundIconButton(FontAwesomeIcons.plus,
                       (){
                         setState(() {
                           weight++;
                         });
                       },
                       ),
                    SizedBox(width: 10.0,),
                       RoundIconButton(FontAwesomeIcons.minus, (){
                         setState(() {
                           weight--;
                         });
                       },)
                  ],
                   ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: MainWidget(
                kActiveCardColor,cardChild:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('AGE',style: kLabelTextStyle,),
                  Text(age.toString(),style:kNumberTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      RoundIconButton(FontAwesomeIcons.plus,
                            (){
                          setState(() {
                            age++;
                          });
                        },
                      ),
                      SizedBox(width: 10.0,),
                      RoundIconButton(FontAwesomeIcons.minus, (){
                        setState(() {
                          age--;
                        });
                      },)
                    ],
                  ),
                ],
              ),
              ),
            )
          ],),),
          BottomButton((){

            CalculatorBrain calc = CalculatorBrain(height, weight);

            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            )));
          },'CALCULATE',),
        ],
      ),

    );
  }
}








