// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonText, required this.onTab});
  final String buttonText;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: onTab,
            child: Container(
              child: Center(
                child: Text(
                  buttonText,
                  style: largeButtonTextStyle,
                  ),
              ),
              color: Colors.orange,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 50,
            ),
          );
  }
}