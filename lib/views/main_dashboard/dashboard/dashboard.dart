import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/routes/app_routes.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:reminder/utils/constants/images.dart';
import 'package:reminder/views/main_dashboard/followups/follwups.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<QuickActionModel> quickActions = [
    QuickActionModel(
      icon: "https://cdn-icons-png.flaticon.com/128/7887/7887065.png",
      title: 'Add Customer',
      color: Colors.green,
      path: AppRoutes.addCustomer,
    ),
    QuickActionModel(
      icon: "https://cdn-icons-png.flaticon.com/128/10608/10608883.png",
      title: 'Add Product',
      color: Colors.blue,
      path: AppRoutes.addProduct,
    ),
    QuickActionModel(
      icon: "https://cdn-icons-png.flaticon.com/128/18511/18511190.png",
      title: 'Add Service',
      color: Colors.teal,
      path: AppRoutes.addService,
    ),
    QuickActionModel(
      icon: "https://cdn-icons-png.flaticon.com/128/11066/11066109.png",
      title: 'Add Invoice',
      color: Colors.indigo,
      path: AppRoutes.addInvoice,
    ),
    QuickActionModel(
      icon: "https://cdn-icons-png.flaticon.com/128/10313/10313117.png",
      title: 'Add Followup',
      color: Colors.orange,
      path: AppRoutes.addFollowup,
    ),
    QuickActionModel(
      icon: "https://cdn-icons-png.flaticon.com/128/10608/10608883.png",
      title: 'Customer Product',
      color: Colors.cyan,
      path: AppRoutes.addCustomerProduct,
    ),
    QuickActionModel(
      icon: "https://cdn-icons-png.flaticon.com/128/16868/16868714.png",
      title: 'Service History',
      color: Colors.purple,
      path: AppRoutes.addServiceHistory,
    ),
    QuickActionModel(
      icon: "https://cdn-icons-png.flaticon.com/128/10951/10951869.png",
      title: 'Products',
      color: Colors.deepOrange,
      path: AppRoutes.products,
    ),
    QuickActionModel(
      icon: "https://cdn-icons-png.flaticon.com/128/9640/9640038.png",
      title: 'Invoices',
      color: Colors.amber,
      path: AppRoutes.invoices,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.inputBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 280,
            toolbarHeight: 80,
            backgroundColor: AppColors.primaryBlue,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
            ),
            titleSpacing: 20,
            title: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(AppImages.roLogo, fit: BoxFit.cover),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'RO Water',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        'Reminders & Services',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                GlassIconButton(
                  icon: "https://cdn-icons-png.flaticon.com/128/8509/8509651.png",
                  onTap: () {
                    context.push(AppRoutes.notifications);
                  },
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 240,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      gradient: LinearGradient(
                        colors: [AppColors.primaryBlue, AppColors.lightBlue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Decorative circles for premium feel
                        Positioned(
                          top: -40,
                          right: -30,
                          child: Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: 0.1),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          left: -20,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: 0.1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 130,
                    left: 20,
                    right: 20,
                    child: HeroBanner(),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Stats Grid
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.15,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    children: const [
                      TopStatCard(
                        title: 'Total Customers',
                        count: '48',
                        icon:
                            "https://cdn-icons-png.flaticon.com/128/166/166258.png",
                        iconColor: Colors.blue,
                        percentColor: Colors.green,
                      ),
                      TopStatCard(
                        title: 'Total Invoices',
                        count: '32',
                        icon:
                            "https://cdn-icons-png.flaticon.com/128/9485/9485672.png",
                        iconColor: Colors.green,
                        percentColor: Colors.green,
                      ),
                      TopStatCard(
                        title: 'Total Services',
                        count: '18',
                        icon:
                            "https://cdn-icons-png.flaticon.com/128/8898/8898827.png",
                        iconColor: Colors.purple,
                        percentColor: Colors.green,
                      ),
                      TopStatCard(
                        title: 'Pending Followups',
                        count: '7',
                        icon:
                            "https://cdn-icons-png.flaticon.com/128/3893/3893258.png",
                        iconColor: Colors.orange,
                        percentColor: Colors.red,
                      ),
                    ],
                  ),

                  // Revenue & Invoice Stats
                  const RevenueCard(),
                  const SizedBox(height: 16),
                  const InvoiceStatsCard(),
                  const SizedBox(height: 30),

                  // Quick Actions
                  const Text(
                    'Quick Actions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: quickActions.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                    itemBuilder: (context, index) {
                      return QuickActionCard(
                        icon: quickActions[index].icon,
                        title: quickActions[index].title,
                        color: quickActions[index].color,
                        onTap: () {
                          context.push(quickActions[index].path);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  // Followups
                  const HeaderCard(
                    title: 'Upcoming Followups',
                    icon: Icons.calendar_month_rounded,
                    iconColor: Colors.blue,
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return const FollowupCard(
                        name: 'Rahul Sharma',
                        phone: '+91 98765 43210',
                        status: 'Scheduled',
                        statusColor: Colors.teal,
                        statusBg: Color(0x19009688),
                        date: 'Today, 10:00 AM',
                        serviceType: 'Service Check',
                        initials: 'RS',
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  // Services
                  const HeaderCard(
                    title: 'Upcoming Services',
                    icon: Icons.build_circle_rounded,
                    iconColor: Colors.purple,
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return const FollowupCard(
                        name: 'Rahul Sharma',
                        phone: '+91 98765 43210',
                        status: 'Scheduled',
                        statusColor: Colors.teal,
                        statusBg: Color(0x19009688),
                        date: 'Today, 10:00 AM',
                        serviceType: 'Service Check',
                        initials: 'RS',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GlassIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const GlassIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 44,
            width: 44,

            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
            ),
            alignment: Alignment.center,
            child: Image.network(icon, height: 24),
          ),
        ),
      ),
    );
  }
}

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: 0.15),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Good Morning,\nAdmin 👋',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Here\'s what\'s happening with your RO Water services today.',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary.withValues(alpha: 0.8),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryBlue.withValues(alpha: 0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage(AppImages.roLogo),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopStatCard extends StatelessWidget {
  final String title;
  final String count;
  final String icon;
  final Color iconColor;
  final Color percentColor;

  const TopStatCard({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.iconColor,
    required this.percentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: iconColor.withValues(alpha: 0.12),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  icon,
                  height: 24,
                  width: 24,
                  errorBuilder: (_, __, ___) =>
                      Icon(Icons.show_chart, color: iconColor),
                ),
              ),
              Icon(Icons.trending_up_rounded, color: percentColor, size: 20),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                count,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 2),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;

  const HeaderCard({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 18),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        Text(
          'View All',
          style: TextStyle(
            fontSize: 13,
            color: Colors.blue.shade700,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class QuickActionCard extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const QuickActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.lerp(color, Colors.white, 0.2) ?? color, color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.35),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Image.network(
                icon,
                height: 24,
                width: 24,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RevenueCard extends StatelessWidget {
  const RevenueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryBlue, AppColors.lightBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.account_balance_wallet_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Revenue',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '₹ 48,750',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '↑ 15%',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'This Month',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w600,
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

class InvoiceStatsCard extends StatelessWidget {
  const InvoiceStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 15,
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
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green.shade400,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    const Expanded(
                      child: Text(
                        'Paid Invoices',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '26',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      '81%',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: 0.81,
                    minHeight: 8,
                    backgroundColor: Colors.grey.shade100,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.green.shade400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(width: 1, height: 60, color: Colors.grey.shade200),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.pending_actions_rounded,
                      color: Colors.redAccent.shade200,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    const Expanded(
                      child: Text(
                        'Pending Invoices',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '6',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      '19%',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: 0.19,
                    minHeight: 8,
                    backgroundColor: Colors.grey.shade100,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.redAccent.shade200,
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

class QuickActionModel {
  final String icon;
  final String title;
  final String path;
  final Color color;

  QuickActionModel({
    required this.icon,
    required this.title,
    required this.path,
    required this.color,
  });
}
