import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  static final FlutterTts flutterTts = FlutterTts();

  static Future<void> speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.45);
    await flutterTts.speak(text);
  }
}
