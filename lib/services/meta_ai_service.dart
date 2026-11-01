import 'dart:convert';
import 'package:http/http.dart' as http;

class MetaAIService {
  static const String apiUrl = "https://api.llama-api.com/chat/completions";
  static String? apiKey;

  static Future<String> correctWriting(String userEnglish) async {
    final prompt = """
You are an English tutor for beginner and intermediate Chinese students.
User wrote this English sentence/paragraph:
$userEnglish

Do these:
1. Mark grammar mistakes
2. Rewrite corrected version
3. Give simple explanation
4. Translate ALL your feedback into Chinese (中文)
Format clearly:
【Corrected】
【Mistakes】
【Explanation】
【中文翻译】
""";

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "model": "llama3.1-70b",
        "messages": [{"role": "user", "content": prompt}],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["choices"][0]["message"]["content"];
    } else {
      return "AI error: ${response.statusCode}";
    }
  }
}
