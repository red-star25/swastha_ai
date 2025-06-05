import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swastha_ai/common_widgets/app_bottom_nav_bar.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/constants/text_theme.dart';
import 'package:swastha_ai/features/profile/presentation/pages/help_center_page.dart';
import 'package:swastha_ai/features/profile/presentation/pages/terms_of_service_page.dart';
import 'package:swastha_ai/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notificationsEnabled = false;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavBar(selectedIndex: 3),
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text('Profile', style: AppTextTheme.h4),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 24),
          Center(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 54,
                      backgroundColor: AppColors.primary.withOpacity(0.08),
                      backgroundImage: AssetImage(Assets.images.dashImg1.path),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Sophia Carter',
                      style: AppTextTheme.h4.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Member since 2022',
                      style: AppTextTheme.bodyMedium.copyWith(
                        color: const Color(0xFF6B7280),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.edit, color: Color(0xFF222B45)),
                    tooltip: 'Edit Profile',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfilePage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Settings',
            style: AppTextTheme.h4.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          // Notifications toggle
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SwitchListTile(
              activeColor: AppColors.primary,
              value: notificationsEnabled,
              onChanged: (val) => setState(() => notificationsEnabled = val),
              title: Row(
                children: [
                  const Icon(
                    Icons.notifications_none,
                    color: Color(0xFF222B45),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Notifications',
                    style: AppTextTheme.bodyMedium.copyWith(fontSize: 16),
                  ),
                ],
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              inactiveThumbColor: Colors.grey.shade300,
              inactiveTrackColor: Colors.grey.shade200,
            ),
          ),
          const SizedBox(height: 12),
          // Dark mode toggle
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SwitchListTile(
              value: darkModeEnabled,
              onChanged: (val) => setState(() => darkModeEnabled = val),
              title: Row(
                children: [
                  const Icon(Icons.nightlight_round, color: Color(0xFF222B45)),
                  const SizedBox(width: 16),
                  Text(
                    'Dark Mode',
                    style: AppTextTheme.bodyMedium.copyWith(fontSize: 16),
                  ),
                ],
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              activeColor: AppColors.primary,
              inactiveThumbColor: Colors.grey.shade300,
              inactiveTrackColor: Colors.grey.shade200,
            ),
          ),
          const SizedBox(height: 12),
          // Language
          _ProfileListTile(
            icon: Icons.language,
            label: 'Language',
            trailing: Text(
              'English',
              style: AppTextTheme.bodyMedium.copyWith(fontSize: 16),
            ),
            onTap: () {},
          ),
          // Help Center
          _ProfileListTile(
            icon: Icons.help_outline,
            label: 'Help Center',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpCenterPage()),
              );
            },
          ),
          // Invite Friends
          _ProfileListTile(
            icon: Icons.person_add_alt_1_outlined,
            label: 'Invite Friends',
            onTap: () async {
              await SharePlus.instance.share(
                ShareParams(
                  subject: 'Download Swastha AI app',
                  text:
                      'Download Swastha AI app and start your journey to a healthier life!',
                ),
              );
            },
          ),
          // Rate Us
          _ProfileListTile(
            icon: Icons.star_border,
            label: 'Rate Us',
            onTap: () async {
              const url =
                  'https://play.google.com/store/apps/details?id=com.swasthaai.app';
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
          ),
          // Terms of Service
          _ProfileListTile(
            icon: Icons.description_outlined,
            label: 'Terms of Service',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TermsOfServicePage(),
                ),
              );
            },
          ),
          // Log Out
          _ProfileListTile(
            icon: Icons.logout,
            label: 'Log Out',
            onTap: () async {
              final shouldLogout = await showDialog<bool>(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text('Log Out'),
                      content: const Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Log Out'),
                        ),
                      ],
                    ),
              );
              if (shouldLogout == true) {
                // TODO: Clear user session here
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil('/login', (route) => false);
              }
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _ProfileListTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget? trailing;
  final VoidCallback? onTap;
  const _ProfileListTile({
    required this.icon,
    required this.label,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF222B45)),
        title: Text(
          label,
          style: AppTextTheme.bodyMedium.copyWith(fontSize: 16),
        ),
        trailing:
            trailing ??
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: Color(0xFFB0B7C3),
            ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        minLeadingWidth: 0,
      ),
    );
  }
}
