import 'package:flutter/material.dart';

class VocabScreen extends StatelessWidget {
  const VocabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vocabulary")),
      body: const Center(child: Text("Vocabulary Page")),
    );
  }
}
