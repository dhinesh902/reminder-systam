import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/routes/app_routes.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:reminder/utils/constants/images.dart';
import 'package:reminder/views/main_dashboard/customers/customer_detail.dart';

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
      color: Colors.purpleAccent,
      path: AppRoutes.addProduct,
    ),
    QuickActionModel(
      icon: "https://cdn-icons-png.flaticon.com/128/18511/18511190.png",
      title: 'Add Service',
      color: Colors.deepPurpleAccent,
      path: AppRoutes.addService,
    ),
    QuickActionModel(
      icon: "https://cdn-icons-png.flaticon.com/128/11066/11066109.png",
      title: 'Add Invoice',
      color: Colors.blue,
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
      title: 'Add Customer Product',
      color: Colors.cyan,
      path: AppRoutes.addCustomerProduct,
    ),
    QuickActionModel(
      icon: "https://cdn-icons-png.flaticon.com/128/11066/11066109.png",
      title: 'Add Service History',
      color: Colors.pink,
      path: AppRoutes.addServiceHistory,
    ),
    QuickActionModel(
      icon: "https://cdn-icons-png.flaticon.com/128/10951/10951869.png",
      title: 'Products',
      color: Colors.deepOrange,
      path: AppRoutes.products,
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
            expandedHeight: 250,
            toolbarHeight: 70,
            backgroundColor: AppColors.primaryBlue,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            titleSpacing: 16,
            title: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(AppImages.roLogo),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'RO Water',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Reminders & Services',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.push(AppRoutes.notifications);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Image.network(
                      "https://cdn-icons-png.flaticon.com/128/18421/18421884.png",
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/1077/1077012.png",
                  ),
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      gradient: LinearGradient(
                        colors: [AppColors.primaryBlue, AppColors.textPrimary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 120,
                    left: 16,
                    right: 16,
                    child: HeroBanner(),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.25,
                    padding: EdgeInsets.symmetric(vertical: 15),
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
                  RevenueCard(),
                  SizedBox(height: 16),
                  InvoiceStatsCard(),
                  SizedBox(height: 16),
                  const Text(
                    'Quick Actions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: quickActions.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.1,
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
                  HeaderCard(
                    title: 'Upcoming Followups',
                    icon: Icons.calendar_month,
                    iconColor: Colors.blue,
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return UpcomingListItem(
                        name: 'Priya Sharma',
                        desc: 'Service Followup',
                        dateTime: '17 Apr 2025 • 02:00 PM',
                        status: 'Pending',
                        statusColor: Colors.orange,
                        initials: 'PS',
                        avatarBg: AppColors.inputBackground,
                        avatarColor: Colors.redAccent,
                      );
                    },
                  ),

                  const SizedBox(height: 16),
                  HeaderCard(
                    title: 'Upcoming Services',
                    icon: Icons.build,
                    iconColor: Colors.purple,
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return UpcomingListItem(
                        name: 'Sunita Devi',
                        desc: 'UV Lamp Replacement',
                        dateTime: '20 Apr 2025 • 10:00 AM',
                        status: 'Scheduled',
                        statusColor: Colors.blue,
                        initials: 'SD',
                        avatarBg: AppColors.inputBorder,
                        avatarColor: Colors.purple,
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

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Good Morning,\nAdmin 👋',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Here\'s what\'s happening with your\nRO Water services today.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(icon, height: 20),
          ),
          const SizedBox(height: 8),
          Text(
            count,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
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
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 16),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        Text(
          'View All >',
          style: TextStyle(
            fontSize: 11,
            color: Colors.blue.shade700,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class UpcomingListItem extends StatelessWidget {
  final String name;
  final String desc;
  final String dateTime;
  final String status;
  final Color statusColor;
  final String initials;
  final Color avatarBg;
  final Color avatarColor;

  const UpcomingListItem({
    super.key,
    required this.name,
    required this.desc,
    required this.dateTime,
    required this.status,
    required this.statusColor,
    required this.initials,
    required this.avatarBg,
    required this.avatarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: avatarBg,
            child: Text(
              initials,
              style: TextStyle(
                color: avatarColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  desc,
                  style: const TextStyle(fontSize: 11, color: Colors.black54),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 10,
                      color: Colors.black45,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      dateTime,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
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
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, size: 16, color: Colors.black26),
        ],
      ),
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
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.lerp(color, Colors.white, 0.2) ?? color, color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Image.network(
                icon,
                height: 20,
                width: 20,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w700,
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.water_drop,
              color: Colors.blue.shade300,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Revenue',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '₹ 48,750',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '↑ 15%',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Text(
                  'This Month',
                  style: TextStyle(fontSize: 10, color: Colors.blue),
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 5,
            offset: const Offset(0, 2),
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
                      Icons.description,
                      color: Colors.blue.shade300,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    const Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Paid Invoices',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '26',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '81%',
                      style: TextStyle(fontSize: 11, color: Colors.black45),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.81,
                    minHeight: 6,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(width: 1, height: 50, color: Colors.grey.shade200),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.blue.shade300,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    const Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pending Invoices',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '6',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '19%',
                      style: TextStyle(fontSize: 11, color: Colors.black45),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.19,
                    minHeight: 6,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.redAccent,
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
