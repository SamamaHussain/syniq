import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syniq/services/gemini_service.dart';
import 'package:equatable/equatable.dart';

part 'ats_score_state.dart';
part 'ats_score_event.dart';

class ATSScoreBloc extends Bloc<ATSScoreEvent, ATSScoreState> {
  final GeminiService _geminiService;

  ATSScoreBloc({required GeminiService geminiService})
    : _geminiService = geminiService,
      super(ATSScoreInitial()) {
    on<AnalyzeResume>(_onAnalyzeResume);
    on<ResetATSScore>(_onReset);
  }

  Future<void> _onAnalyzeResume(
    AnalyzeResume event,
    Emitter<ATSScoreState> emit,
  ) async {
    emit(ATSScoreLoading());

    try {
      final prompt = _buildPrompt(event.resumeText, event.jobDescription);
      final response = await _geminiService.generateResponse(prompt);
      final result = _parseResponse(response);
      emit(ATSScoreLoaded(result: result));
    } catch (e) {
      emit(ATSScoreError(message: e.toString()));
    }
  }

  String _buildPrompt(String resumeText, String? jobDescription) {
    return '''
You are an expert ATS (Applicant Tracking System) analyzer. Analyze the following resume and provide a detailed ATS score and feedback.

Resume:
$resumeText
${jobDescription != null ? '\nJob Description:\n$jobDescription' : ''}

Provide the analysis in JSON format with the following structure:
{
  "overallScore": 0-100,
  "categories": [
    {
      "name": "Format & Readability",
      "score": 0-100,
      "feedback": "brief feedback"
    },
    {
      "name": "Keywords Optimization",
      "score": 0-100,
      "feedback": "brief feedback"
    },
    {
      "name": "Experience Relevance",
      "score": 0-100,
      "feedback": "brief feedback"
    },
    {
      "name": "Education & Skills",
      "score": 0-100,
      "feedback": "brief feedback"
    }
  ],
  "strengths": ["strength1", "strength2", "strength3"],
  "improvements": ["improvement1", "improvement2", "improvement3"],
  "summary": "Overall summary of the resume's ATS compatibility"
}

Return ONLY valid JSON, no other text.
''';
  }

  ATSResult _parseResponse(String response) {
    try {
      // Extract JSON from response (in case Gemini adds extra text)
      final jsonStr = _extractJson(response);
      final Map<String, dynamic> json = jsonDecode(jsonStr);

      final categories = (json['categories'] as List)
          .map(
            (c) => ATSCategory(
              name: c['name'],
              score: c['score'],
              feedback: c['feedback'],
            ),
          )
          .toList();

      return ATSResult(
        overallScore: json['overallScore'],
        categories: categories,
        strengths: List<String>.from(json['strengths']),
        improvements: List<String>.from(json['improvements']),
        summary: json['summary'],
      );
    } catch (e) {
      throw Exception('Failed to parse ATS result: $e');
    }
  }

  String _extractJson(String text) {
    final start = text.indexOf('{');
    final end = text.lastIndexOf('}') + 1;
    if (start != -1 && end > start) {
      return text.substring(start, end);
    }
    throw Exception('No JSON found in response');
  }

  void _onReset(ResetATSScore event, Emitter<ATSScoreState> emit) {
    emit(ATSScoreInitial());
  }
}
