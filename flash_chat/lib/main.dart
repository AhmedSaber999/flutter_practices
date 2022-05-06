// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/chat_screen.dart';

void main(){
  runApp(FlashChat());
} 

class FlashChat extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   textTheme: const TextTheme(
      //     bodyText1: TextStyle(color: Colors.black54),
      //   ),
      // ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id :(context) =>  WelcomeScreen(),
        ChatScreen.id :(context) =>  ChatScreen(),
        RegistrationScreen.id :(context) =>  RegistrationScreen(),
        LoginScreen.id :(context) =>  LoginScreen(),
      },
    );
  }
}
