// ignore_for_file: prefer_const_constructors, deprecated_member_use, constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/app_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';


class InputPage extends StatefulWidget {
  const InputPage({ Key? key }) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  double height = 100;
  double weight = 50;
  int age = 10;
  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: AppCard(
                  color: _selectedGender == Gender.Male? activeCardColor : inactiveCardColor,
                  childContent: IconContent('Male', FontAwesomeIcons.mars),
                  onPress: (){
                    setState(() {
                      _selectedGender = Gender.Male;
                    });
                  }
                ),
              ),
              Expanded(
                child: AppCard(
                  color: _selectedGender == Gender.Female? activeCardColor : inactiveCardColor,
                  childContent: IconContent('Female', FontAwesomeIcons.venus),
                  onPress: (){
                    setState(() {
                      _selectedGender = Gender.Female;
                    });
                  }
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
               Expanded(
                  child: AppCard(
                    color: activeCardColor,
                    childContent: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'height',
                          style: textLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height.round().toString(),
                              style: numberLabelStyle,
                            ),
                            Text(
                              'cm',
                              style: textLabelStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            thumbColor: Colors.orange[400],
                            overlayColor: Colors.red,
                            overlayShape: RoundSliderThumbShape(enabledThumbRadius: 30.0),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: inactiveCardColor ,
                          ),
                          child: Slider(
                            value: height,
                            min: 0,
                            max: 300,
                            // activeColor: Colors.orange,
                            onChanged: (newValue){
                              setState(() {
                                height = newValue;
                                height = height;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    onPress: (){}
                  ),
              ),
            ],
          ),
        ),
        Expanded(
           child: Row(
            children: [
              Expanded(
                child: AppCard(
                  color: activeCardColor,
                  childContent: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: textLabelStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: numberLabelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                            shape: CircleBorder(),
                            fillColor: Color(0xFF4C4F5E),
                            elevation: 10,
                            constraints: BoxConstraints.tightFor(
                              width: 55,
                              height: 55
                            ),
                            onPressed: (){
                              setState(() {
                                weight > 1 ? weight-- : weight;
                              });
                            }
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          RawMaterialButton(
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                            constraints: BoxConstraints.tightFor(
                              width: 55,
                              height: 55
                            ),
                            fillColor: Color(0xFF4C4F5E),
                            shape: CircleBorder(),
                            elevation: 10,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            }
                          ),
                        ],
                      )
                    ],
                  ),
                  onPress: (){}
                ),
              ),
              Expanded(
                  child: AppCard(
                  color: activeCardColor,
                  childContent: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: textLabelStyle,
                      ),
                      Text(
                        age.toString(),
                        style: numberLabelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                            constraints: BoxConstraints.tightFor(
                              width: 55,
                              height: 55
                            ),
                            shape: CircleBorder(),
                            fillColor: Color(0xFF4C4F5E),
                            elevation: 10,
                            onPressed: (){
                              setState(() {
                                age > 1 ? age-- : age;
                              });
                            }
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          RawMaterialButton(
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                            constraints: BoxConstraints.tightFor(
                              width: 55,
                              height: 55
                            ),
                            fillColor: Color(0xFF4C4F5E),
                            shape: CircleBorder(),
                            elevation: 10,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            }
                          ),
                        ],
                      )
                    ],
                  ),
                  onPress: (){}
                ),
              ),
            ],
          ),
        ),
        BottomButton(
          buttonText: 'Calculate',
          onTab: (){
            var calculator = CalculatorBrain(height: height, weight: weight);
            calculator.calculateBMI();
            Navigator.push(
              context,
               MaterialPageRoute(
                 builder: (context) => ResultsPage(
                   calculator
                 )));
          }
        )
      ],
    );
  }
}




enum Gender{
  Male, 
  Female 
}