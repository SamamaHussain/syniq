import 'package:equatable/equatable.dart';

abstract class ATSScoreState extends Equatable {
  const ATSScoreState();

  @override
  List<Object?> get props => [];
}

class ATSScoreInitial extends ATSScoreState {
  const ATSScoreInitial();
}

class ATSScoreLoading extends ATSScoreState {
  const ATSScoreLoading();
}

class ATSScoreLoaded extends ATSScoreState {
  final ATSResult result;

  const ATSScoreLoaded({required this.result});

  @override
  List<Object?> get props => [result];
}

class ATSScoreError extends ATSScoreState {
  final String message;

  const ATSScoreError({required this.message});

  @override
  List<Object?> get props => [message];
}

class ATSResult {
  final int overallScore;
  final List<ATSCategory> categories;
  final List<String> strengths;
  final List<String> improvements;
  final String summary;

  ATSResult({
    required this.overallScore,
    required this.categories,
    required this.strengths,
    required this.improvements,
    required this.summary,
  });

  @override
  String toString() {
    return 'ATSResult(score: $overallScore, categories: ${categories.length})';
  }
}

class ATSCategory {
  final String name;
  final int score;
  final String feedback;

  ATSCategory({
    required this.name,
    required this.score,
    required this.feedback,
  });
}
