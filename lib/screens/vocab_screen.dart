import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VocabScreen extends StatefulWidget {
  const VocabScreen({super.key});

  @override
  State<VocabScreen> createState() => _VocabScreenState();
}

class _VocabScreenState extends State<VocabScreen> {
  final FlutterTts tts = FlutterTts();

  static const List<Map<String, String>> words = [
    {"en": "apple", "cn": "苹果"},
    {"en": "banana", "cn": "香蕉"},
    {"en": "book", "cn": "书"},
    {"en": "computer", "cn": "电脑"},
    {"en": "family", "cn": "家庭"},
    {"en": "friend", "cn": "朋友"},
    {"en": "happy", "cn": "开心的"},
    {"en": "house", "cn": "房子"},
    {"en": "school", "cn": "学校"},
    {"en": "water", "cn": "水"},
  ];

  Future<void> speak(String text) async {
    await tts.setLanguage("en-US");
    await tts.setSpeechRate(0.45);
    await tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vocabulary")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: words.length,
        itemBuilder: (ctx, index) {
          final item = words[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              onTap: () => speak(item["en"]!),
              title: Text(
                item["en"]!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                item["cn"]!,
                style: const TextStyle(fontSize: 16),
              ),
              trailing: const Icon(Icons.volume_up),
            ),
          );
        },
      ),
    );
  }
}
