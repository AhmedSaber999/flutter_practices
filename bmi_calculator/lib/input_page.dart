// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/app_card.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({ Key? key }) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

const activeCardColor = Color.fromARGB(255, 65, 67, 90);
class _InputPageState extends State<InputPage> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: AppCard(activeCardColor),
              ),
              Expanded(
                child: AppCard(activeCardColor),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
               Expanded(
                  child: AppCard(activeCardColor),
              ),
            ],
          ),
        ),
        Expanded(
           child: Row(
            children: [
              Expanded(
                child: AppCard(activeCardColor),
              ),
              Expanded(
                child: AppCard(activeCardColor),
              ),
            ],
          ),
        ),
        Container(
          color: Color(0xFFEB1555),
          width: double.infinity,
          margin: EdgeInsets.only(top: 10.0),
          height: 10,
        )
      ],
    );
  }
}