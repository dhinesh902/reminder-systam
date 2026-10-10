import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';

class Followups extends StatelessWidget {
  const Followups({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const FollowupHeader(),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF4F7FC),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const FollowupCategoryChips(),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          FollowupCard(
                            name: 'Rahul Sharma',
                            phone: '+91 98765 43210',
                            status: 'Scheduled',
                            statusColor: Colors.teal,
                            statusBg: Colors.teal.withOpacity(0.1),
                            date: 'Today, 10:00 AM',
                            serviceType: 'Service Check',
                            initials: 'RS',
                          ),
                          FollowupCard(
                            name: 'Priya Singh',
                            phone: '+91 87654 32109',
                            status: 'Scheduled',
                            statusColor: Colors.teal,
                            statusBg: Colors.teal.withOpacity(0.1),
                            date: 'Today, 02:30 PM',
                            serviceType: 'Filter Replacement',
                            initials: 'PS',
                          ),
                          FollowupCard(
                            name: 'Neha Verma',
                            phone: '+91 91234 56789',
                            status: 'Upcoming',
                            statusColor: Colors.blue,
                            statusBg: Colors.blue.withOpacity(0.1),
                            date: 'Tomorrow, 11:00 AM',
                            serviceType: 'General Checkup',
                            initials: 'NV',
                          ),
                          FollowupCard(
                            name: 'Rohit Kumar',
                            phone: '+91 99887 66554',
                            status: 'Upcoming',
                            statusColor: Colors.blue,
                            statusBg: Colors.blue.withOpacity(0.1),
                            date: 'Apr 28, 2025',
                            serviceType: 'RO Membrane Check',
                            initials: 'RK',
                          ),
                          FollowupCard(
                            name: 'Sandeep Yadav',
                            phone: '+91 90011 22334',
                            status: 'Upcoming',
                            statusColor: Colors.blue,
                            statusBg: Colors.blue.withOpacity(0.1),
                            date: 'Apr 29, 2025',
                            serviceType: 'Filter Replacement',
                            initials: 'SY',
                          ),
                          FollowupCard(
                            name: 'Anjali Kapoor',
                            phone: '+91 98123 45678',
                            status: 'Overdue',
                            statusColor: Colors.redAccent,
                            statusBg: Colors.redAccent.withOpacity(0.1),
                            date: 'Apr 30, 2025',
                            serviceType: 'Water Quality Test',
                            initials: 'AK',
                          ),
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryBlue,
        elevation: 4,
        child: const Icon(Icons.add, color: AppColors.white, size: 28),
      ),
    );
  }
}

class FollowupHeader extends StatelessWidget {
  const FollowupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.arrow_back, color: AppColors.white, size: 24),
              SizedBox(width: 16),
              Text(
                'Follow Up',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const Icon(Icons.calendar_month_outlined, color: AppColors.white, size: 26),
        ],
      ),
    );
  }
}

class FollowupCategoryChips extends StatelessWidget {
  const FollowupCategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: const [
          FollowupChip(label: 'All', isSelected: true),
          SizedBox(width: 12),
          FollowupChip(label: 'Today'),
          SizedBox(width: 12),
          FollowupChip(label: 'Upcoming'),
          SizedBox(width: 12),
          FollowupChip(label: 'Overdue'),
        ],
      ),
    );
  }
}

class FollowupChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FollowupChip({
    super.key,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryBlue : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? AppColors.white : AppColors.textSecondary,
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
        ),
      ),
    );
  }
}

class FollowupCard extends StatelessWidget {
  final String name;
  final String phone;
  final String status;
  final Color statusColor;
  final Color statusBg;
  final String date;
  final String serviceType;
  final String initials;

  const FollowupCard({
    super.key,
    required this.name,
    required this.phone,
    required this.status,
    required this.statusColor,
    required this.statusBg,
    required this.date,
    required this.serviceType,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFFE8F4FA),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                initials,
                style: const TextStyle(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusBg,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  phone,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 14, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(date, style: const TextStyle(fontSize: 11, color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.build_outlined, size: 14, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text(serviceType, style: const TextStyle(fontSize: 11, color: Colors.black54)),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
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
