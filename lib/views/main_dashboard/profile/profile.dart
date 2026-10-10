import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/routes/app_routes.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC), // Premium background
      body: Stack(
        children: [
          // Dynamic Premium Background Gradient
          Container(
            height: 360,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.lightBlue,
                  AppColors.primaryBlue,
                  Color(0xFF002A5C),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.4, 1.0],
              ),
            ),
          ),
          // Decorative background circles for premium feel
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                // Top Settings Icon
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.settings_outlined,
                        color: AppColors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),

                // Profile Info
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                          border: Border.all(color: AppColors.white, width: 3),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Rahul Sharma',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: AppColors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              '+91 98765 43210',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'rahul.sharma@example.com',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        border: Border.all(
                          color: AppColors.white.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // White Curved Container with List
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryBlue.withOpacity(0.15),
                          blurRadius: 30,
                          offset: const Offset(0, -10),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 36,
                      ),
                      child: Column(
                        children: [
                          ProfileListTile(
                            icon:
                                "https://cdn-icons-png.flaticon.com/128/1077/1077012.png",
                            title: 'Edit Profile',
                            subtitle: 'Edit your profile',
                            onTap: () => context.push(AppRoutes.editProfile),
                          ),
                          ProfileDivider(),
                          ProfileListTile(
                            icon:
                                "https://cdn-icons-png.flaticon.com/128/10951/10951869.png",
                            title: 'Customer Products',
                            subtitle: 'View customer products history',
                          ),
                          ProfileDivider(),
                          ProfileListTile(
                            icon:
                                "https://cdn-icons-png.flaticon.com/128/3631/3631163.png",
                            title: 'Services History',
                            subtitle: 'View service history and upcoming',
                            onTap: () => context.push(AppRoutes.serviceHistory),
                          ),
                          ProfileDivider(),
                          ProfileListTile(
                            icon:
                                "https://cdn-icons-png.flaticon.com/128/8983/8983163.png",
                            title: 'Payment History',
                            subtitle: 'View your payment history',
                          ),
                          ProfileDivider(),
                          ProfileListTile(
                            icon:
                                "https://cdn-icons-png.flaticon.com/128/18421/18421884.png",
                            title: 'Notifications',
                            subtitle: 'Service alerts, offers and updates',
                          ),
                          ProfileDivider(),
                          ProfileListTile(
                            icon:
                                "https://cdn-icons-png.flaticon.com/128/7887/7887097.png",
                            title: 'Help & Support',
                            subtitle: 'FAQs, chat and contact us',
                          ),
                          SizedBox(height: 45),
                          ProfileLogoutButton(),
                          SizedBox(height: 70),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const ProfileListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withValues(alpha: .04),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlue.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Image.network(icon, height: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFFF7F9FC),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primaryBlue,
                size: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDivider extends StatelessWidget {
  const ProfileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Divider(
        color: Colors.grey.shade100,
        thickness: 1.5,
        indent: 60,
      ), // Indent to align with text
    );
  }
}

class ProfileLogoutButton extends StatelessWidget {
  const ProfileLogoutButton({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.white,
          titlePadding: const EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
            bottom: 12,
          ),
          contentPadding: const EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 24,
          ),
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          title: const Text(
            'Confirm Logout',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          content: const Text(
            'Are you sure you want to log out of your current session?',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.textSecondary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                context.go(AppRoutes.login);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkRed,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showLogoutDialog(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.darkRed.withValues(alpha: .7),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.red.shade200,
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.logout_rounded, color: AppColors.white, size: 22),
            SizedBox(width: 10),
            Text(
              'Logout',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
