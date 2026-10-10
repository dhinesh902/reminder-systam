import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/routes/app_routes.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:reminder/utils/date/dateutils.dart';
import 'package:reminder/utils/custom_launchers.dart';
import 'package:reminder/views/main_dashboard/products/products.dart';
import 'package:reminder/widgets/add_button.dart';
import 'package:reminder/widgets/custom_search_bar.dart';
import 'package:reminder/views/main_dashboard/followups/followup_detail.dart';

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
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    CustomSearchBar(hintText: "Search follow-ups..."),
                    const SizedBox(height: 16),
                    const FollowupCategoryChips(),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 150),
                        itemCount: 8,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Products(),
                                ),
                              );
                            },
                            child: const FollowupCard(
                              name: 'Rahul Sharma',
                              phone: '+91 98765 43210',
                              status: 'Scheduled',
                              statusColor: Colors.teal,
                              statusBg: Color(0x19009688),
                              // Colors.teal.withOpacity(0.1)
                              date: 'Today, 10:00 AM',
                              serviceType: 'Service Check',
                              initials: 'RS',
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: CustomFloatingAddButton(
        padding: const EdgeInsets.only(bottom: 70),
        title: "Add Followup",
        onTap: () {
          context.push(AppRoutes.addFollowup);
        },
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
            children: [
              Image.network(
                "https://cdn-icons-png.flaticon.com/128/14996/14996125.png",
                height: 24,
              ),
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
          GestureDetector(
            onTap: () => selectGlobalDateRange(context),
            child: const Icon(
              Icons.calendar_month_outlined,
              color: AppColors.white,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}

class FollowupCategoryChips extends StatefulWidget {
  const FollowupCategoryChips({super.key});

  @override
  State<FollowupCategoryChips> createState() => _FollowupCategoryChipsState();
}

class _FollowupCategoryChipsState extends State<FollowupCategoryChips> {
  String selectedChip = 'All';
  final List<String> chips = [
    'All',
    'Today',
    'Upcoming',
    'Overdue',
    'Completed',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: chips.map((label) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedChip = label;
                });
              },
              child: FollowupChip(
                label: label,
                isSelected: selectedChip == label,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class FollowupChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FollowupChip({super.key, required this.label, this.isSelected = false});

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
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryBlue.withValues(alpha: 0.1),
                  ),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: const TextStyle(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
                        Expanded(
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primaryBlue,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
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
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone_android_rounded,
                          size: 13,
                          color: AppColors.orange,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          phone,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 13,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              date,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.build_outlined,
                              size: 13,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              serviceType,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(height: 1, color: Colors.grey.shade200),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => openCall(phone),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.blue.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.call,
                          color: AppColors.primaryBlue,
                          size: 16,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Call',
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () => openWhatsApp(phone),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.green.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          "https://cdn-icons-png.flaticon.com/128/3670/3670051.png",
                          height: 16,
                          width: 16,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'WhatsApp',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
