import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyEnglish + 中文',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text("EasyEnglish + 中文")),
        body: const Center(child: Text("Test Build OK")),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
