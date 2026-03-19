import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syniq/services/gemini_service.dart';

import 'ats_score_event.dart';
import 'ats_score_state.dart';

export 'ats_score_event.dart';
export 'ats_score_state.dart';

class ATSScoreBloc extends Bloc<ATSScoreEvent, ATSScoreState> {
  final GeminiService _geminiService;

  ATSScoreBloc({required GeminiService geminiService})
    : _geminiService = geminiService,
      super(const ATSScoreInitial()) {
    on<AnalyzeResume>(_onAnalyzeResume);
    on<ResetATSScore>(_onReset);
  }

  Future<void> _onAnalyzeResume(
    AnalyzeResume event,
    Emitter<ATSScoreState> emit,
  ) async {
    emit(const ATSScoreLoading());

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
You are an expert ATS (Applicant Tracking System) analyzer. You will receive a text document. Your task is to analyze it if it is a resume, or indicate that it is not a valid resume.

First, determine if the provided text is a resume. A resume typically contains sections like Work Experience, Education, Skills, and possibly a summary. It is about an individual's professional background.

If the text does NOT appear to be a resume (e.g., it is an article, random text, or something else), then return ONLY the following JSON structure:
{
  "isResume": false,
  "message": "The provided document does not appear to be a resume. Please upload a valid resume file."
}

If the text IS a resume, then analyze it and provide an ATS score and feedback in the following JSON structure. For any fields that cannot be determined due to lack of information, use reasonable defaults (e.g., empty lists for strengths/improvements, a neutral score of 50 for categories, and a summary stating that the resume lacks sufficient detail).

Valid resume analysis JSON structure:
{
  "isResume": true,
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

Resume text:
$resumeText
${jobDescription != null ? '\nJob Description:\n$jobDescription' : ''}
''';
  }

  ATSResult _parseResponse(String response) {
    try {
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
    emit(const ATSScoreInitial());
  }
}
