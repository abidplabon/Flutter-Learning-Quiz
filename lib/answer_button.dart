import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key,required this.textAnswer,required this.onTap});   // vitor a thakel onno file a ai parameter easy access pawa jaye
  final String textAnswer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          backgroundColor: const Color.fromARGB(255, 36, 45, 80),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)
          )
        ),
        child: Text(textAnswer,textAlign: TextAlign.center,),
    );
  }
}
