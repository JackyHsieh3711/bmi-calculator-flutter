
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';



enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;

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
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                  ),
                )
              ],
            )),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                 cardChild: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Text('HEIGHT', style: kLabelTextStyle,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.baseline,
                       textBaseline: TextBaseline.alphabetic,
                       children: <Widget>[
                         Text(height.toString(), style: kNumberTextStyle,),
                         Text('cm', style: kLabelTextStyle,)
                       ],
                     ),
                     SliderTheme(
                       data: SliderTheme.of(context).copyWith(
                         thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                         overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                         thumbColor: Color(0xFFEB1555),
                         activeTrackColor: Colors.white,
                         overlayColor: Color(0x1fEB1555),
                         inactiveTickMarkColor: Color(0xFF8D8E98),
                       ),
                       child: Slider(
                         value: height.toDouble(),
                         min: 120.0,
                         max: 220.0,
                         onChanged: (double newValue){
                           setState(() {
                             height = newValue.round();
                           });
                         },
                       ),
                     )
                   ],
                 ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kLabelTextStyle,),
                        Text(weight.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: null,
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kLabelTextStyle,),
                        Text(age.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                              setState(() {
                                age--;
                              });
                            }),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                              setState(() {
                                age++;
                              });
                            },),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            BottomButton(buttonTitle: 'CALCULATE', onTap: (){
              
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ResultPage(
                  bmiString: calc.calaulateBMI(), 
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                );
              }));
            },),
          ],
        ));
  }
}








