import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,required this.choosen_answer});

  final List<String> choosen_answer;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary=[];  // Map ar modhe string and Object pair
    for (var i=0;i<choosen_answer.length;i++){
      summary.add({
        'question_index':i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer':choosen_answer[i]
      });
    }
    return summary;
}

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $numTotalQuestions out of $numCorrectQuestions questions correctly!"),
            const SizedBox(height: 30,),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 30,),
            TextButton(onPressed: (){}, child: const Text('Restart Quiz!'))
          ],
        ),
      ),

    );
  }
}
