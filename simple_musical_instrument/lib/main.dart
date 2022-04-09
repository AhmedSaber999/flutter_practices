// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('assets_note$soundNumber.wav');
  }

  Expanded buildSoundedButton({required Color color, required int soundNumber}) {
    return Expanded(
      child: FlatButton(
        child: const Text(''),
        color: color,
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildSoundedButton(color: Colors.red, soundNumber: 1),
                buildSoundedButton(color: Colors.orange, soundNumber: 2),
                buildSoundedButton(color: Colors.yellow, soundNumber: 3),
                buildSoundedButton(color: Colors.green, soundNumber: 4),
                buildSoundedButton(color: Colors.teal, soundNumber: 5),
                buildSoundedButton(color: Colors.blue, soundNumber: 6),
                buildSoundedButton(color: Colors.purple, soundNumber: 7),
              ],
          ),
        ),
      ),
    );
  }
}