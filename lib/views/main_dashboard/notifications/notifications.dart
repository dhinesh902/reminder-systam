import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/widgets/premium_sliver_app_bar.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.inputBackground,
      appBar: const PremiumSliverAppBar(title: 'Notifications'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          const _DateHeader(title: 'TODAY'),
          const NotificationCard(
            title: 'Filter Replacement Due',
            message:
                'Rahul Sharma\'s RO filter replacement is due today.',
            time: '10 mins ago',
            icon: Icons.water_drop_rounded,
            color: Colors.blue,
            isNew: true,
          ),
          const NotificationCard(
            title: 'Payment Received',
            message:
                'Payment of ₹1,500 received from Priya Singh for routine service.',
            time: '2 hours ago',
            icon: Icons.currency_rupee_rounded,
            color: Colors.green,
            isNew: true,
          ),
          const SizedBox(height: 16),
          const _DateHeader(title: 'YESTERDAY'),
          const NotificationCard(
            title: 'New Service Request',
            message:
                'Neha Verma has requested a new RO installation at her office.',
            time: 'Yesterday, 04:00 PM',
            icon: Icons.build_circle_rounded,
            color: Colors.orange,
            isNew: false,
          ),
        ],
      ),
    );
  }
}

class _DateHeader extends StatelessWidget {
  final String title;

  const _DateHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w800,
          color: AppColors.textSecondary,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color color;
  final bool isNew;

  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.color,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isNew ? color.withValues(alpha: 0.03) : AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isNew ? color.withValues(alpha: 0.2) : Colors.white,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isNew
                ? color.withValues(alpha: 0.08)
                : Colors.black.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: isNew ? FontWeight.w800 : FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    if (isNew) ...[
                      const SizedBox(width: 8),
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(top: 6),
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: color.withValues(alpha: 0.4),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: Colors.black.withValues(alpha: 0.3),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black.withValues(alpha: 0.4),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
