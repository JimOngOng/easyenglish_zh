import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int current = 0;
  int score = 0;

  final List<Map<String, dynamic>> quiz = [
    {
      "q": "What is apple?",
      "a": ["苹果", "香蕉", "书"],
      "ans": 0
    },
    {
      "q": "What is book?",
      "a": ["电脑", "书", "水"],
      "ans": 1
    },
    {
      "q": "What is happy?",
      "a": ["房子", "学校", "开心的"],
      "ans": 2
    },
  ];

  void pickAnswer(int idx) {
    if (idx == quiz[current]["ans"]) {
      score++;
    }
    setState(() {
      current++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (current >= quiz.length) {
      return Scaffold(
        appBar: AppBar(title: const Text("Quiz")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your score: $score / ${quiz.length}", style: const TextStyle(fontSize:24)),
              const SizedBox(height:20),
              ElevatedButton(
                onPressed: (){
                  setState((){
                    current=0;
                    score=0;
                  });
                },
                child: const Text("Restart Quiz"),
              )
            ],
          ),
        ),
      );
    }

    final q = quiz[current];
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Practice")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Question ${current+1}/${quiz.length}", style: const TextStyle(fontSize:16)),
            const SizedBox(height:12),
            Text(q["q"], style: const TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
            const SizedBox(height:30),
            ...List.generate(q["a"].length, (i){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  onPressed: ()=>pickAnswer(i),
                  child: Text(q["a"][i]),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
