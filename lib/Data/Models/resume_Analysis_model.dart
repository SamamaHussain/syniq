// Data Models
class ResumeAnalysis {
  final String fileName;
  final DateTime uploadDate;
  final int score;
  final List<ResumeSection> sections;

  ResumeAnalysis({
    required this.fileName,
    required this.uploadDate,
    required this.score,
    required this.sections,
  });
}

class ResumeSection {
  final String title;
  final String content;
  bool isExpanded;

  ResumeSection({
    required this.title,
    required this.content,
    this.isExpanded = false,
  });
}
