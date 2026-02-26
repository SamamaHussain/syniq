// lib/modules/settings/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syniq/core/themes/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                'Settings',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Manage your account and preferences',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
              ),
              const SizedBox(height: 32),

              // Profile Section
              _buildSectionTitle('Profile'),
              const SizedBox(height: 16),
              _buildProfileCard(),
              const SizedBox(height: 32),

              // Preferences Section
              _buildSectionTitle('Preferences'),
              const SizedBox(height: 16),
              _buildPreferenceTile(
                icon: Icons.notifications_none,
                title: 'Notifications',
                subtitle: 'Resume updates, tips, and recommendations',
                trailing: _buildSwitch(value: true),
              ),
              _buildDivider(),
              _buildPreferenceTile(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                subtitle: 'Switch to dark theme',
                trailing: _buildSwitch(value: false),
              ),
              _buildDivider(),
              _buildPreferenceTile(
                icon: Icons.language_outlined,
                title: 'Language',
                subtitle: 'English (US)',
                trailing: Icon(Icons.chevron_right, color: AppColors.textHint),
                onTap: () {
                  // Navigate to language selection
                },
              ),
              const SizedBox(height: 32),

              // Resume Settings
              _buildSectionTitle('Resume Settings'),
              const SizedBox(height: 16),
              _buildActionTile(
                icon: Icons.format_size,
                title: 'Default Resume Format',
                subtitle: 'PDF, DOCX',
              ),
              _buildDivider(),
              _buildActionTile(
                icon: Icons.auto_awesome,
                title: 'AI Analysis Preferences',
                subtitle: 'Configure analysis parameters',
              ),
              _buildDivider(),
              _buildActionTile(
                icon: Icons.save_outlined,
                title: 'Auto-save Drafts',
                subtitle: 'Save progress automatically',
                trailing: _buildSwitch(value: true),
              ),
              const SizedBox(height: 32),

              // Account
              _buildSectionTitle('Account'),
              const SizedBox(height: 16),
              _buildActionTile(
                icon: Icons.person_outline,
                title: 'Personal Information',
                subtitle: 'Name, email, phone',
              ),
              _buildDivider(),
              _buildActionTile(
                icon: Icons.security_outlined,
                title: 'Privacy & Security',
                subtitle: 'Password, data sharing',
              ),
              _buildDivider(),
              _buildActionTile(
                icon: Icons.history_outlined,
                title: 'Resume History',
                subtitle: 'View past analyses',
              ),
              _buildDivider(),
              _buildActionTile(
                icon: Icons.delete_outline,
                title: 'Delete Account',
                subtitle: 'Permanently remove account',
                textColor: AppColors.error,
                iconColor: AppColors.error,
              ),
              const SizedBox(height: 32),

              // Support
              _buildSectionTitle('Support'),
              const SizedBox(height: 16),
              _buildActionTile(
                icon: Icons.help_outline,
                title: 'Help Center',
                subtitle: 'FAQs and guides',
              ),
              _buildDivider(),
              _buildActionTile(
                icon: Icons.feedback_outlined,
                title: 'Send Feedback',
                subtitle: 'Help us improve Syniq',
              ),
              _buildDivider(),
              _buildActionTile(
                icon: Icons.info_outline,
                title: 'About',
                subtitle: 'Version 1.0.0',
              ),
              const SizedBox(height: 40),

              // Logout Button
              Center(
                child: TextButton(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: AppColors.error,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondaryBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.accent1,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.person, color: AppColors.black, size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alex Johnson', // TODO: Replace with actual user name
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'alex.johnson@email.com', // TODO: Replace with actual email
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit_outlined, color: AppColors.accent1),
            onPressed: () {
              // Navigate to edit profile
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPreferenceTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.accent2,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.black, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: AppColors.textHint, fontSize: 14),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    Color? textColor,
    Color? iconColor,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.accent2,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor ?? AppColors.black, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: AppColors.textHint, fontSize: 14),
      ),
      trailing:
          trailing ?? Icon(Icons.chevron_right, color: AppColors.textHint),
      onTap: () {
        // Navigate to respective screen
      },
    );
  }

  Widget _buildSwitch({required bool value}) {
    return Switch(
      value: value,
      onChanged: (newValue) {
        // Handle switch change
      },
      activeColor: AppColors.accent1,
      activeTrackColor: AppColors.accent1.withOpacity(0.3),
      inactiveThumbColor: AppColors.textHint,
      inactiveTrackColor: AppColors.textHint.withOpacity(0.3),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Divider(color: AppColors.textHint.withOpacity(0.2), height: 1),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.primaryBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.logout, color: AppColors.error, size: 32),
                ),
                const SizedBox(height: 16),
                Text(
                  'Log Out',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Are you sure you want to log out?',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform logout
                          Navigator.pop(context);
                          // Navigate to login screen
                          context.go('/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.error,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Log Out',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
