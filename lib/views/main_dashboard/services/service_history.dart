import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/routes/app_routes.dart';
import 'package:reminder/widgets/custom_search_bar.dart';

class ServiceHistory extends StatelessWidget {
  const ServiceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Service History',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.inputBackground, // Light grey background
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    CustomSearchBar(),
                    const SizedBox(height: 24),
                    // Tabs
                    const ServiceHistoryCategoryChips(),
                    const SizedBox(height: 16),
                    // List
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          const HistoryCard(
                            name: 'Ramesh Kumar',
                            phone: '+91 98765 43210',
                            initials: 'RK',
                            serviceType: 'RO Service (Annual)',
                            date: '16 Apr 2025',
                            technician: 'Amit Sharma',
                            serviceNo: 'SRV-001',
                            status: 'Completed',
                          ),
                          const HistoryCard(
                            name: 'Priya Sharma',
                            phone: '+91 99887 76655',
                            initials: 'PS',
                            serviceType: 'Filter Cartridge Change',
                            date: '17 Oct 2024',
                            technician: 'Rahul Singh',
                            serviceNo: 'SRV-002',
                            status: 'Completed',
                          ),
                          const HistoryCard(
                            name: 'Anil Gupta',
                            phone: '+91 98765 12345',
                            initials: 'AG',
                            serviceType: 'RO Service (Annual)',
                            date: '10 Apr 2024',
                            technician: 'Amit Sharma',
                            serviceNo: 'SRV-003',
                            status: 'Completed',
                          ),
                          const HistoryCard(
                            name: 'Suresh Patel',
                            phone: '+91 91234 56789',
                            initials: 'SP',
                            serviceType: 'Filter Cartridge Change',
                            date: '12 Oct 2023',
                            technician: 'Rahul Singh',
                            serviceNo: 'SRV-004',
                            status: 'Overdue',
                          ),
                          const SizedBox(height: 100),
                          // spacing for bottom nav if present
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
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String name;
  final String phone;
  final String status;
  final String date;
  final String serviceType;
  final String initials;
  final String serviceNo;
  final String technician;

  const HistoryCard({
    super.key,
    required this.name,
    required this.phone,
    required this.status,
    required this.date,
    required this.serviceType,
    required this.initials,
    required this.serviceNo,
    required this.technician,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.serviceHistoryDetail),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryBlue.withValues(alpha: 0.06),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withValues(alpha: 0.08),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryBlue.withValues(alpha: 0.15),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      initials,
                      style: const TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.w900,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textPrimary,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: status == 'Completed'
                                  ? Colors.green.withValues(alpha: 0.1)
                                  : Colors.orange.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              status,
                              style: TextStyle(
                                color: status == 'Completed'
                                    ? Colors.green
                                    : Colors.orange,
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone_android_rounded,
                            size: 14,
                            color: AppColors.textSecondary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            phone,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_rounded,
                            size: 14,
                            color: Colors.blueAccent,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            date,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.build_circle_rounded,
                            size: 15,
                            color: AppColors.primaryBlue,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            serviceType,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Divider(color: Color(0xFFEEEEEE), height: 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Tech: $technician',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  'ID: $serviceNo',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceHistoryCategoryChips extends StatefulWidget {
  const ServiceHistoryCategoryChips({super.key});

  @override
  State<ServiceHistoryCategoryChips> createState() =>
      _ServiceHistoryCategoryChipsState();
}

class _ServiceHistoryCategoryChipsState
    extends State<ServiceHistoryCategoryChips> {
  String selectedChip = 'All Services';
  final List<String> chips = [
    'All Services',
    'Upcoming Services',
    'Completed Services',
    'Overdue Services',
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
              child: ServiceHistoryChip(
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

class ServiceHistoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const ServiceHistoryChip({
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
