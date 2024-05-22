import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kelompok_oal/provider/Quizchek.dart';
import '../provider/QuizProvider.dart';

class MyTest extends StatelessWidget {
  const MyTest({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Test Uji Radio Button"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              quizProvider.currentQuiz.question,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),
          ...quizProvider.currentQuiz.wrongAnswers.map((wrongAnswer) {
            return RadioListTile<String>(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(wrongAnswer,
                    style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
              ),
              value: wrongAnswer,
              groupValue: quizProvider.currentQuiz.selectedAnswer,
              onChanged: (String? value) {
                quizProvider.currentQuiz.selectedAnswer = value;
                Provider.of<QuizProvider>(context, listen: false)
                    .notifyListeners();
              },
            );
          }).toList(),
          RadioListTile<String>(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(quizProvider.currentQuiz.rightAnswer,
                  style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
            ),
            value: quizProvider.currentQuiz.rightAnswer,
            groupValue: quizProvider.currentQuiz.selectedAnswer,
            onChanged: (String? value) {
              quizProvider.currentQuiz.selectedAnswer = value;
              Provider.of<QuizProvider>(context, listen: false)
                  .notifyListeners();
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (quizProvider.currentQuizIndex ==
                      quizProvider.quizzes.length - 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyTest2()));
                  } else {
                    quizProvider.nextQuiz(); // Assuming nextQuiz is a function
                  }
                },
                child: Text("Next"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: quizProvider.currentQuizIndex == 0
                    ? null
                    : quizProvider.previousQuiz,
                child: Text("Previous"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyTest2 extends StatelessWidget {
  const MyTest2({super.key});

  @override
  Widget build(BuildContext context) {
    final quizCheck = Provider.of<Quizchek>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Test Uji Radio Button"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              quizCheck.currentQuiz.question,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),
          ...quizCheck.currentQuiz.wrongAnswers.map((wrongAnswer) {
            return CheckboxListTile(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(wrongAnswer,
                    style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
              ),
              value: wrongAnswer == quizCheck.currentQuiz.selectedAnswer,
              onChanged: (bool? value) {
                if (value != null) {
                  if (value) {
                    quizCheck.currentQuiz.selectedAnswer = wrongAnswer;
                  } else {
                    quizCheck.currentQuiz.selectedAnswer = wrongAnswer;
                  }
                  Provider.of<Quizchek>(context, listen: false)
                      .notifyListeners();
                }
              },
            );
          }).toList(),
          CheckboxListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(quizCheck.currentQuiz.rightAnswer,
                  style: TextStyle(fontSize: 16), textAlign: TextAlign.left),
            ),
            value: quizCheck.currentQuiz.selectedAnswer ==
                quizCheck.currentQuiz.rightAnswer,
            onChanged: (bool? value) {
              if (value != null) {
                if (value) {
                  quizCheck.currentQuiz.selectedAnswer =
                      quizCheck.currentQuiz.rightAnswer;
                } else {
                  quizCheck.currentQuiz.selectedAnswer =
                      quizCheck.currentQuiz.rightAnswer;
                }
                Provider.of<Quizchek>(context, listen: false).notifyListeners();
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed:
                    quizCheck.currentQuizIndex == quizCheck.quizzes.length - 1
                        ? null
                        : quizCheck.nextQuiz,
                child: Text("Next"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: quizCheck.currentQuizIndex == 0
                    ? null
                    : quizCheck.previousQuiz,
                child: Text("Previous"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
