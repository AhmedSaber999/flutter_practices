// ignore_for_file: use_key_in_widget_constructors

import 'package:chat_fluuter/screens/login_screen.dart';
import 'package:chat_fluuter/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: SizedBox(
                      child: Image.asset('images/logo.png'),
                      height: 80.0,
                    ),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            getRoundedButton(
              context,
              'Log In',
               () { Navigator.pushNamed(context, LoginScreen.id); },
              Colors.lightBlueAccent
            ),
            getRoundedButton(
              context,
              'Register',
               () { Navigator.pushNamed(context, RegistrationScreen.id); },
              Colors.blueAccent
            ),
          ],
        ),
      ),
    );
  }
}



Widget getRoundedButton(BuildContext context, String buttonText, VoidCallback onPressed, Color color){
  return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: color,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: onPressed,
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    buttonText,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
}