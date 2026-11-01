import 'package:flutter/material.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  final TextEditingController _controller = TextEditingController();
  String result = "";

  void checkText(){
    final text = _controller.text.trim();
    if(text.isEmpty) return;
    setState(() {
      result = "✅ Received your writing:\n$text\n\n(We can connect API here later for grammar correction)";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Writing Check")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "Write your English sentence here...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height:16),
            ElevatedButton(onPressed: checkText, child: const Text("Check Writing")),
            const SizedBox(height:20),
            Expanded(child: SingleChildScrollView(child: Text(result, style: const TextStyle(fontSize:16)))),
          ],
        ),
      ),
    );
  }
}
