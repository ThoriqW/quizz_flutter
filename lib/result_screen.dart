import 'package:flutter/material.dart';
import 'package:adv_basics/data/question.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chooseAnswer, this.restartQuiz, {super.key});

  final List<String> chooseAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': question[i].text,
        'correct_answer': question[i].answer[0],
        'user_answer': chooseAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = question.length;
    final numCorrectAnswer = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your answered $numCorrectAnswer out of $numTotalQuestion question correctly!",
              style: GoogleFonts.lato(
                fontSize: 20,
                color: const Color.fromARGB(255, 76, 5, 8),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            QuestionSummary(summaryData),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 243, 167, 171),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text("Restart Quiz!!"),
            )
          ],
        ),
      ),
    );
  }
}
