import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:reminder/views/main_dashboard/main_dashboard.dart'; // To access MainDashboardState
import 'package:reminder/views/main_dashboard/followups/follwups.dart'; // To access FollowupCard
import 'package:go_router/go_router.dart';
import 'package:reminder/routes/app_routes.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC), // Premium background
      body: Stack(
        children: [
          // Blue Premium Gradient Background
          Container(
            height: 320,
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
          // Decorative circles
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: DashboardHeader(),
                ),
                const SizedBox(height: 16),

                // Greeting and Avatar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Good Morning,',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Rohan 👋',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                          border: Border.all(color: AppColors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 35,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // White Curved Container taking the rest of the screen
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F7FC), // Match other screens
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryBlue.withValues(alpha: 0.15),
                          blurRadius: 30,
                          offset: const Offset(0, -10),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 32,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Stats Grid
                          Row(
                            children: const [
                              Expanded(
                                child: StatCard(
                                  title: 'Products',
                                  count: '120',
                                  icon: Icons.water_drop_rounded,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: StatCard(
                                  title: 'Services',
                                  count: '45',
                                  icon: Icons.build_rounded,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: const [
                              Expanded(
                                child: StatCard(
                                  title: 'Customers',
                                  count: '850',
                                  icon: Icons.people_rounded,
                                  color: Colors.teal,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: StatCard(
                                  title: 'Sales',
                                  count: '₹ 1.2L',
                                  icon: Icons.currency_rupee_rounded,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),

                          // Quick Action Cards
                          const Text(
                            "Quick Actions",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ActionCard(
                                  title: 'Products',
                                  subtitle: 'Directory',
                                  icon:
                                      "https://cdn-icons-png.flaticon.com/128/10951/10951869.png",
                                  gradientColors: const [
                                    Color(0xFFF857A6),
                                    Color(0xFFFF5858),
                                  ],
                                  onTap: () {
                                    context.push(AppRoutes.products);
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: ActionCard(
                                  title: 'Invoices',
                                  subtitle: 'Billing',
                                  icon:
                                      "https://cdn-icons-png.flaticon.com/128/9640/9640038.png",
                                  gradientColors: const [
                                    Color(0xFFF09819),
                                    Color(0xFFFF512F),
                                  ],
                                  onTap: () {
                                    context.push(AppRoutes.invoices);
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ActionCard(
                                  title: 'Products',
                                  subtitle: 'Directory',
                                  icon:
                                      "https://cdn-icons-png.flaticon.com/128/10951/10951869.png",
                                  gradientColors: const [
                                    Color(0xFF0F2027),
                                    Color(0xFF2C5364),
                                  ],
                                  onTap: () {
                                    context.push(AppRoutes.products);
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: ActionCard(
                                  title: 'Invoices',
                                  subtitle: 'Billing',
                                  icon:
                                      "https://cdn-icons-png.flaticon.com/128/9640/9640038.png",
                                  gradientColors: const [
                                    Color(0xFF373B44),
                                    Color(0xFF4286F4),
                                  ],
                                  onTap: () {
                                    context.push(AppRoutes.invoices);
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),

                          // Today Followups
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Today's Followups",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.primaryBlue,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .findAncestorStateOfType<
                                        MainDashboardState
                                      >()
                                      ?.changeTab(2);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBlue.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Text(
                                    'View All',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryBlue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          FollowupCard(
                            name: 'Rahul Sharma',
                            phone: '+91 98765 43210',
                            status: 'Scheduled',
                            statusColor: Colors.teal,
                            statusBg: Colors.teal.withValues(alpha: 0.1),
                            date: 'Today, 10:00 AM',
                            serviceType: 'Routine Checkup',
                            initials: 'RS',
                          ),
                          FollowupCard(
                            name: 'Priya Singh',
                            phone: '+91 87654 32109',
                            status: 'Scheduled',
                            statusColor: Colors.teal,
                            statusBg: Colors.teal.withValues(alpha: 0.1),
                            date: 'Today, 02:30 PM',
                            serviceType: 'Filter Replacement',
                            initials: 'PS',
                          ),
                          FollowupCard(
                            name: 'Neha Verma',
                            phone: '+91 91234 56789',
                            status: 'Upcoming',
                            statusColor: Colors.blue,
                            statusBg: Colors.blue.withValues(alpha: 0.1),
                            date: 'Today, 04:00 PM',
                            serviceType: 'Installation',
                            initials: 'NV',
                          ),
                          const SizedBox(height: 32),
                          // Upcoming Services
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Upcoming Services",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.primaryBlue,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBlue.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Text(
                                    'View All',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryBlue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          FollowupCard(
                            name: 'Rohit Kumar',
                            phone: '+91 99887 66554',
                            status: 'Upcoming',
                            statusColor: Colors.blue,
                            statusBg: Colors.blue.withValues(alpha: 0.1),
                            date: 'Apr 28, 2025',
                            serviceType: 'RO Membrane Check',
                            initials: 'RK',
                          ),
                          FollowupCard(
                            name: 'Sandeep Yadav',
                            phone: '+91 90011 22334',
                            status: 'Upcoming',
                            statusColor: Colors.blue,
                            statusBg: Colors.blue.withValues(alpha: 0.1),
                            date: 'Apr 29, 2025',
                            serviceType: 'Filter Replacement',
                            initials: 'SY',
                          ),
                          const SizedBox(height: 100),
                          // Space for floating bottom nav
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

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.menu_rounded,
            color: AppColors.white,
            size: 24,
          ),
        ),
        GestureDetector(
          onTap: () => context.push(AppRoutes.notifications),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
              Positioned(
                right: 2,
                top: 2,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF4B4B),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primaryBlue, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            count,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const ActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: gradientColors.last.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(icon, height: 30),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
