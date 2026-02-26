// lib/modules/insights/view/screens/insights_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syniq/Data/Models/resume_Analysis_model.dart';
import 'package:syniq/core/themes/app_colors.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  // Sample data - Replace with actual data from your backend
  final List<ResumeAnalysis> _recentAnalyses = [
    ResumeAnalysis(
      fileName: 'Software_Engineer_Resume.pdf',
      uploadDate: DateTime.now().subtract(const Duration(hours: 2)),
      score: 92,
      sections: [
        ResumeSection(
          title: 'Contact Information',
          content:
              'John Doe\njohn.doe@email.com\n(555) 123-4567\nSan Francisco, CA',
          isExpanded: false,
        ),
        ResumeSection(
          title: 'Professional Summary',
          content:
              'Experienced Software Engineer with 5+ years in full-stack development. Proficient in Flutter, Python, and cloud technologies. Passionate about creating scalable applications and solving complex problems.',
          isExpanded: false,
        ),
        ResumeSection(
          title: 'Work Experience',
          content:
              'Senior Software Engineer | Tech Corp\n2021 - Present\n• Led development of 3 major mobile apps\n• Improved app performance by 40%\n• Mentored 5 junior developers\n\nSoftware Engineer | Startup Inc\n2019 - 2021\n• Built RESTful APIs using Python\n• Implemented CI/CD pipelines',
          isExpanded: false,
        ),
        ResumeSection(
          title: 'Education',
          content:
              'B.S. Computer Science\nStanford University\n2015 - 2019\nGPA: 3.8/4.0',
          isExpanded: false,
        ),
        ResumeSection(
          title: 'Skills',
          content:
              '• Flutter • Dart • Python • JavaScript\n• Firebase • AWS • Git • REST APIs\n• UI/UX Design • Agile Methodology',
          isExpanded: false,
        ),
        ResumeSection(
          title: 'Projects',
          content:
              'E-commerce App (Flutter) - 10k+ downloads\nPortfolio Website - React\nTask Management API - Node.js',
          isExpanded: false,
        ),
        ResumeSection(
          title: 'Certifications',
          content:
              '• Google Associate Android Developer\n• AWS Certified Developer\n• Flutter Advanced Course',
          isExpanded: false,
        ),
        ResumeSection(
          title: 'Languages',
          content:
              '• English (Native)\n• Spanish (Intermediate)\n• French (Basic)',
          isExpanded: false,
        ),
      ],
    ),
    ResumeAnalysis(
      fileName: 'Product_Manager_Resume.pdf',
      uploadDate: DateTime.now().subtract(const Duration(days: 2)),
      score: 78,
      sections: [
        ResumeSection(
          title: 'Contact Information',
          content:
              'Jane Smith\njane.smith@email.com\n(555) 987-6543\nNew York, NY',
          isExpanded: false,
        ),
        ResumeSection(
          title: 'Professional Summary',
          content:
              'Product Manager with 4+ years experience in SaaS. Track record of launching successful products and leading cross-functional teams.',
          isExpanded: false,
        ),
        ResumeSection(
          title: 'Work Experience',
          content:
              'Product Manager | Tech Solutions\n2020 - Present\n• Launched 2 successful products\n• Increased user engagement by 60%\n\nAssociate PM | Digital Agency\n2018 - 2020\n• Managed product roadmap',
          isExpanded: false,
        ),
        ResumeSection(
          title: 'Education',
          content: 'MBA - Marketing\nColumbia University\n2016 - 2018',
          isExpanded: false,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const SizedBox(height: 10),
              Text(
                'Insights',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'View your resume analyses and extracted sections',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
              ),
              const SizedBox(height: 32),

              // Recent Analyses List
              ..._recentAnalyses.asMap().entries.map((entry) {
                final index = entry.key;
                final analysis = entry.value;

                return Column(
                  children: [
                    if (index == 0) ...[
                      // Latest file indicator
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accent1.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.new_releases,
                              color: AppColors.accent1,
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Latest Upload',
                              style: TextStyle(
                                color: AppColors.accent1,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    _buildAnalysisCard(analysis),
                    if (index < _recentAnalyses.length - 1)
                      const SizedBox(height: 20),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnalysisCard(ResumeAnalysis analysis) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // File Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // File Icon
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.accent2,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.description,
                        color: AppColors.black,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),

                    // File Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            analysis.fileName,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 14,
                                color: AppColors.textHint,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                DateFormat(
                                  'MMM d, yyyy • h:mm a',
                                ).format(analysis.uploadDate),
                                style: TextStyle(
                                  color: AppColors.textHint,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Score Bar
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Resume Score',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${analysis.score}%',
                                style: TextStyle(
                                  color: analysis.score >= 80
                                      ? AppColors.success
                                      : analysis.score >= 60
                                      ? AppColors.warning
                                      : AppColors.error,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: analysis.score / 100,
                              backgroundColor: AppColors.primaryBg,
                              color: analysis.score >= 80
                                  ? AppColors.success
                                  : analysis.score >= 60
                                  ? AppColors.warning
                                  : AppColors.error,
                              minHeight: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Sections (Expandable)
          ...analysis.sections.asMap().entries.map((entry) {
            final sectionIndex = entry.key;
            final section = entry.value;

            return Column(
              children: [
                if (sectionIndex > 0)
                  Divider(color: AppColors.primaryBg, height: 1, thickness: 2),
                _buildExpandableSection(section),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildExpandableSection(ResumeSection section) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        backgroundColor: AppColors.secondaryBg,
        collapsedBackgroundColor: AppColors.secondaryBg,
        initiallyExpanded: section.isExpanded,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.accent2,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getSectionIcon(section.title),
            color: AppColors.black,
            size: 18,
          ),
        ),
        title: Text(
          section.title,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(
          section.isExpanded
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down,
          color: AppColors.accent1,
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            section.isExpanded = expanded;
          });
        },
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              section.content,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getSectionIcon(String title) {
    switch (title) {
      case 'Contact Information':
        return Icons.contact_mail;
      case 'Professional Summary':
        return Icons.summarize;
      case 'Work Experience':
        return Icons.work;
      case 'Education':
        return Icons.school;
      case 'Skills':
        return Icons.code;
      case 'Projects':
        return Icons.folder;
      case 'Certifications':
        return Icons.verified;
      case 'Languages':
        return Icons.language;
      default:
        return Icons.description;
    }
  }
}
