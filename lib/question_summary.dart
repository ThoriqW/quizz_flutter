import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: data['user_answer'] == data["correct_answer"]
                            ? const Color.fromARGB(255, 229, 151, 255)
                            : const Color.fromARGB(255, 255, 114, 196),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 243, 167, 171),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(data['user_answer'] as String,
                              style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 243, 125, 131),
                              )),
                          Text(data['correct_answer'] as String,
                              style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 206, 142, 248),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
