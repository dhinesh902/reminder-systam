import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:go_router/go_router.dart';

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
                        child: const Icon(Icons.arrow_back, color: AppColors.white, size: 28),
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
                  const Icon(Icons.filter_alt_outlined, color: AppColors.white, size: 26),
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
                    // Customer Card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
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
                              child: const Center(
                                child: Text(
                                  'RK',
                                  style: TextStyle(
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
                                    children: const [
                                      Text(
                                        'Ramesh Kumar',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                                      ),
                                      Icon(Icons.chevron_right, color: Colors.grey),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  const Text('CUST-001', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: const [
                                      Icon(Icons.phone, size: 14, color: AppColors.primaryBlue),
                                      SizedBox(width: 8),
                                      Text('+91 98765 43210', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Tabs
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(color: AppColors.primaryBlue, width: 2)),
                              ),
                              child: const Center(
                                child: Text("Service History", style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.transparent, width: 2)),
                              ),
                              child: const Center(
                                child: Text("Next Service", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // List
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          const HistoryCard(
                            icon: Icons.build,
                            title: 'RO Service (Annual)',
                            date: '16 Apr 2025',
                            technician: 'Amit Sharma',
                            serviceNo: 'SRV-001',
                            status: 'Completed',
                          ),
                          const SizedBox(height: 16),
                          const HistoryCard(
                            icon: Icons.water_drop,
                            title: 'Filter Cartridge Change',
                            date: '17 Oct 2024',
                            technician: 'Rahul Singh',
                            serviceNo: 'SRV-002',
                            status: 'Completed',
                          ),
                          const SizedBox(height: 16),
                          const HistoryCard(
                            icon: Icons.build,
                            title: 'RO Service (Annual)',
                            date: '10 Apr 2024',
                            technician: 'Amit Sharma',
                            serviceNo: 'SRV-003',
                            status: 'Completed',
                          ),
                          const SizedBox(height: 16),
                          const HistoryCard(
                            icon: Icons.water_drop,
                            title: 'Filter Cartridge Change',
                            date: '12 Oct 2023',
                            technician: 'Rahul Singh',
                            serviceNo: 'SRV-004',
                            status: 'Completed',
                          ),
                          const SizedBox(height: 16),
                          const HistoryCard(
                            icon: Icons.build,
                            title: 'RO Service (Annual)',
                            date: '05 Apr 2023',
                            technician: 'Amit Sharma',
                            serviceNo: 'SRV-005',
                            status: 'Completed',
                          ),
                          const SizedBox(height: 100), // spacing for bottom nav if present
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
  final IconData icon;
  final String title;
  final String date;
  final String technician;
  final String serviceNo;
  final String status;

  const HistoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.technician,
    required this.serviceNo,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Color(0xFFE8F4FA),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primaryBlue, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.primaryBlue),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 12, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Technician: $technician', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                const SizedBox(height: 2),
                Text('Service No: $serviceNo', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: const TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
              const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
