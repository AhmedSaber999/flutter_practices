// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Ask me Anything')),
          backgroundColor: Colors.blue[800],
        ),
        body: const MagicBallPage(),
        backgroundColor: Colors.indigo[300],
      ),
    )
  );
}


class MagicBallPage extends StatefulWidget {
  const MagicBallPage({ Key? key }) : super(key: key);

  @override
  State<MagicBallPage> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBallPage> {
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: FlatButton(
              child: Image.asset('images/ball$ballNumber.png'),
              onPressed: (){
                setState(() {
                  ballNumber = (ballNumber % 5) + 1;
                });
              }
            ),
          ),
        ],
      ),
    );
  }
}