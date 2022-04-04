// ignore_for_file: prefer_const_constructors, deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text(
              'Dicee', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 235, 98, 7),
        ),
        body: Dicee(),
        backgroundColor: Colors.orange,
      ),
    )
  );
}

class Dicee extends StatefulWidget {
  const Dicee({ Key? key }) : super(key: key);

  @override
  State<Dicee> createState() => _DiceeState();
}

class _DiceeState extends State<Dicee> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 2;

  void _chnage_dice_number(){
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Expanded(
            flex: 1,
            child: FlatButton(
              child: Image.asset('images/dice$leftDiceNumber.png'), 
              // color: Colors.red,
              onPressed: _chnage_dice_number,
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              child: Image.asset('images/dice$rightDiceNumber.png'),
              // color: Colors.red,
              onPressed:_chnage_dice_number,
            ),
          ),
        ],      
      ),
    );
  
  }
}

// class DicePage extends StatelessWidget {

//   var leftDiceNumber = 1;
//   var rightDiceNumber = 2;


//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         // ignore: prefer_const_literals_to_create_immutables
//         children: [
//           Expanded(
//             flex: 1,
//             child: FlatButton(
//               child: Image.asset('images/dice$leftDiceNumber.png'), 
//               color: Colors.red,
//               onPressed: null,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: FlatButton(
//               child: Image.asset('images/dice$rightDiceNumber.png'),
//               color: Colors.red,
//               onPressed: (){print("Pushed!!");},
//             ),
//           ),
//         ],      
//       ),
//     );
//   }
// }
