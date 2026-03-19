import 'package:equatable/equatable.dart';

abstract class ATSScoreEvent extends Equatable {
  const ATSScoreEvent();

  @override
  List<Object?> get props => [];
}

class AnalyzeResume extends ATSScoreEvent {
  final String resumeText;
  final String? jobDescription;

  const AnalyzeResume({required this.resumeText, this.jobDescription});

  @override
  List<Object?> get props => [resumeText, jobDescription];
}

class ResetATSScore extends ATSScoreEvent {
  const ResetATSScore();
}
