import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(126, 255, 255, 255),
          ),
          const SizedBox(height: 40),
          Text(
            "Learn Flutter the Fun Way!",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 76, 5, 8),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: startQuiz,
            label: const Text(
              "Start Quiz",
            ),
          )
        ],
      ),
    );
  }
}
