import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
   const SplashScreen(this.quiz,{super.key});
   final void Function() quiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,   // column a upor a lagano theke middle a ante
        children: [
          Image.asset('assets/images/quiz-logo.png',width: 383,),
          const SizedBox(height: 45,),
          const Text('Learn Flutter with Quiz',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24
            ),
          ),
          const SizedBox(height: 45,),
          OutlinedButton.icon(
            onPressed:quiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.icecream_outlined),
            label: const Text('Start Quiz') ,
          )
        ],
      ),);
  }
}
