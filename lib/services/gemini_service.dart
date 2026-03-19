import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:syniq/services/env_config.dart';

class GeminiService {
  late final GenerativeModel _model;

  GeminiService() {
    _model = GenerativeModel(
      model: 'gemini-2.5-flash-lite',
      apiKey: EnvConfig.geminiApiKey,
      generationConfig: GenerationConfig(
        temperature: 0.7,
        maxOutputTokens: 2048,
      ),
    );
  }

  Future<String> generateResponse(String prompt) async {
    try {
      final response = await _model.generateContent([Content.text(prompt)]);
      return response.text ?? 'No response generated';
    } catch (e) {
      throw Exception('Gemini API error: $e');
    }
  }

  Future<String> generateWithSystemPrompt({
    required String systemInstruction,
    required String userPrompt,
  }) async {
    try {
      final modelWithSystem = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: EnvConfig.geminiApiKey,
        systemInstruction: Content.system(systemInstruction),
        generationConfig: GenerationConfig(
          temperature: 0.7,
          maxOutputTokens: 2048,
        ),
      );
      final response = await modelWithSystem.generateContent([
        Content.text(userPrompt),
      ]);
      return response.text ?? 'No response generated';
    } catch (e) {
      throw Exception('Gemini API error: $e');
    }
  }
}
