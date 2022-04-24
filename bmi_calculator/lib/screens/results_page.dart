// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/app_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(this._calculatorBrain);
  final CalculatorBrain _calculatorBrain;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: AppCard(
              color:activeCardColor,
              childContent: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    _calculatorBrain.getResult(),
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    _calculatorBrain.calculateBMI(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    _calculatorBrain.getInterpretation()
                  ),
                ],
              ),
              onPress: (){},
            ),
          
          ),
          BottomButton(
            buttonText: 'Re-Calculate', 
            onTab: (){ Navigator.pop(context);})
        ],
      ),
    );
  }
}