// lib/modules/home/view/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syniq/core/themes/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Header
                _buildWelcomeHeader(context),
                const SizedBox(height: 32),

                // Main Features Grid
                _buildFeaturesGrid(context),
                const SizedBox(height: 32),

                // Quick Stats
                _buildQuickStats(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back,',
                  style: TextStyle(
                    color: AppColors.black.withOpacity(0.7),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Alex', // TODO: Replace with actual user name
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.accent1.withOpacity(0.2),
              child: Icon(Icons.person, color: AppColors.accent1, size: 26),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.accent2,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            'Ready to optimize your resume with AI?',
            style: TextStyle(
              color: AppColors.black.withOpacity(0.8),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturesGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            // Feature 1: Resume Upload & Parsing
            _buildFeatureCard(
              title: 'Upload Resume',
              subtitle: 'Auto text extraction',
              icon: Icons.upload_file,
              color: AppColors.accent1,
              onTap: () => context.push('/upload'),
            ),

            // Feature 2: AI Summary Generation
            _buildFeatureCard(
              title: 'AI Summary',
              subtitle: 'Professional summary',
              icon: Icons.auto_awesome,
              color: AppColors.secondaryBg,
              onTap: () => context.push('/ai-summary'),
            ),

            // Feature 3: Resume Analysis
            _buildFeatureCard(
              title: 'Resume Analysis',
              subtitle: 'Get detailed feedback',
              icon: Icons.analytics,
              color: AppColors.accent2,
              onTap: () => context.push('/analysis'),
            ),

            // Feature 4: Job Matching
            _buildFeatureCard(
              title: 'Job Match',
              subtitle: 'Find matching roles',
              icon: Icons.work_outline,
              color: AppColors.accent1,
              onTap: () => context.push('/job-matching'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.black, size: 24),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: AppColors.black.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickStats(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondaryBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Stats',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem(
                count: '3',
                label: 'Resumes',
                icon: Icons.description_outlined,
              ),
              _buildStatItem(
                count: '92%',
                label: 'Avg Score',
                icon: Icons.trending_up_outlined,
              ),
              _buildStatItem(
                count: '15',
                label: 'Tips',
                icon: Icons.lightbulb_outline,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String count,
    required String label,
    required IconData icon,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryBg,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.black, size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          count,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: AppColors.black.withOpacity(0.6),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
