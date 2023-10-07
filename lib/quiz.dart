import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/splashScreen.dart';

import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers=[];    // khali list basket banalam in the page jaita te splash change hoye main screen a jaye

  void switchScreen(){    //button press korle ai state trigger hobay
    setState(() {
      activeScreen = 'question-screen';
    });
  }
  void onSelectAnswer(String answer){     //akta function ja answer tap kore change hole fire hobe & it will take String type answer as parameter
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = SplashScreen(switchScreen);
    if (activeScreen == 'question-screen'){
      screenWidget = Questions(onSelectAnswer:onSelectAnswer);
    }
    if (activeScreen == 'result-screen'){
      screenWidget = ResultScreen(choosen_answer: selectedAnswers,);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 36, 45, 80),
                    Color.fromRGBO(225, 16, 65, 30),],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft
              ),
            ),
            child: screenWidget,    //Question oi page a upor build kora function ta diye dilam jate constantly element add hoite thake
        ),
      ),
    );
  }
}
