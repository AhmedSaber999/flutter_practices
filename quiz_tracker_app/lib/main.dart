// ignore_for_file: deprecated_member_use, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}


class QuizPage extends StatefulWidget {
  const QuizPage({ Key? key }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeperIcons = [];

  int questionNumber = 0;
  List<String> questions = [
    'Q1',
    'Q2',
    'Q3',
    'Q4',
    'Q5'
  ];
  List<bool> answers = [
    true, false, false, true, true
  ];

  void restartQuiz(){
    setState(() {
      questionNumber = 0;
      scoreKeeperIcons.clear();
    });
  }
  void check_answer(bool answer, BuildContext context){
    setState(() {
      if(scoreKeeperIcons.length == questions.length){
        Alert(
          context: context,
          type: AlertType.warning,
          title: "Quiz finished",
          desc: "You finished the quiz quistions :).",
          buttons: [
            DialogButton(
              child: 
                Text(
                  'restart',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                onPressed: (){
                  restartQuiz();
                  Navigator.pop(context);
                },
              width: 120,
            ),
            DialogButton(
              child: Text(
                "Close",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
              color: Colors.red,
            ),
          ],
        ).show();        return;
      }
      if(answer == answers[questionNumber]){
        scoreKeeperIcons.add(
              Icon(
                Icons.check,
                color: Colors.green,
              )
        );
      }
      else{
        scoreKeeperIcons.add(
            Icon(
              Icons.close,
              color: Colors.red,
            )
        );
      }


      if(questionNumber < questions.length - 1) {
        questionNumber++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      questions[questionNumber]
                      ),
                  ),
                )),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: FlatButton(
                      textColor: Colors.white,
                      color: Colors.green, 
                      child: Text("True"),
                      onPressed:(){
                        check_answer(true, context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: FlatButton(
                      child: Text("false"),
                      textColor: Colors.white,
                      color: Colors.red,
                      onPressed: (){
                        check_answer(false, context);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Row(
                    children: scoreKeeperIcons     
                    ,
                  ),
                )
            ],
          ),
        ),
    );
  }
}