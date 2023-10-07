import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class Questions extends StatefulWidget {
  const Questions({super.key,required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
   var currentQuestionIndex = 0;
  void QuestionIndex(String onSelectAnswer){    //jaita fire hoye Q change hobe oi function a Q change ar sathay select kora answer o rakhlam
    widget.onSelectAnswer(onSelectAnswer);
    setState(() {
        currentQuestionIndex++;
    });
}
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Container(                 //container thakel margin pabo so ase pase sob dik a space pabo
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            ...currentQuestion.getShuffledAnswer().map((answer) {     //... mane array ar element alada kore [[1,2,3],4,5] => [1,2,3,4,5]
              return AnswerButton(
                textAnswer:answer,
                onTap: (){
                  QuestionIndex(answer);
                }
              );})
          ],
        ),
      ),
    );
  }
}
