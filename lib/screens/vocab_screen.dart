import 'package:flutter/material.dart';

class VocabScreen extends StatelessWidget {
  const VocabScreen({super.key});

  final List<Map<String, String>> words = [
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item["en"]!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    item["cn"]!,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
