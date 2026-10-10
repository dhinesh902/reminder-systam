import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:reminder/routes/app_routes.dart';
import 'package:reminder/widgets/custom_dialogues.dart';
import 'package:reminder/widgets/add_button.dart';
import 'package:reminder/widgets/custom_search_bar.dart';
import 'package:reminder/widgets/custom_popup_menu.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const ServiceHeader(),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const CustomSearchBar(hintText: "Search services..."),
                    const SizedBox(height: 16),
                    const ServiceCategoryChips(),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 150),
                        children: const [
                          ServiceCard(
                            title: 'RO Installation',
                            description:
                                'Complete installation of RO system with all necessary fittings and setup.',
                            duration: '1 - 2 Hours',
                            price: '1,500.00',
                            icon: Icons.build,
                          ),
                          ServiceCard(
                            title: 'Annual Maintenance',
                            description:
                                'Periodic cleaning and performance check to ensure better water quality.',
                            duration: '1 Hour',
                            price: '1,000.00',
                            icon: Icons.settings,
                          ),
                          ServiceCard(
                            title: 'Filter Replacement',
                            description:
                                'Replace all filters for optimal performance and pure water.',
                            duration: '1 Hour',
                            price: '800.00',
                            icon: Icons.sync,
                          ),
                          ServiceCard(
                            title: 'RO Repair',
                            description:
                                'Fixing leakage, low pressure or other technical issues in RO system.',
                            duration: '1 - 2 Hours',
                            price: '1,200.00',
                            icon: Icons.handyman,
                          ),
                          ServiceCard(
                            title: 'Tank Cleaning',
                            description:
                                'Cleaning and sanitizing water tank for safe and healthy water.',
                            duration: '1 Hour',
                            price: '600.00',
                            icon: Icons.cleaning_services,
                          ),
                          ServiceCard(
                            title: 'AMC (Annual Maintenance Contract)',
                            description:
                                'Yearly service plan with free visits and priority support.',
                            duration: '1 Year',
                            price: '2,500.00',
                            icon: Icons.verified_user,
                          ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: CustomFloatingAddButton(
        padding: const EdgeInsets.only(bottom: 100),
        title: "Add Service",
        onTap: () {
          context.push(AppRoutes.addService);
        },
      ),
    );
  }
}

class ServiceHeader extends StatelessWidget {
  const ServiceHeader({super.key});

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
                "https://cdn-icons-png.flaticon.com/128/12263/12263199.png",
                height: 24,
              ),
              const SizedBox(width: 16),
              const Text(
                'Services',
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
    );
  }
}

class ServiceCategoryChips extends StatefulWidget {
  const ServiceCategoryChips({super.key});

  @override
  State<ServiceCategoryChips> createState() => _ServiceCategoryChipsState();
}

class _ServiceCategoryChipsState extends State<ServiceCategoryChips> {
  String selectedChip = 'All';
  final List<String> chips = [
    'All',
    'Installation',
    'Maintenance',
    'Repair',
    'AMC',
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
              child: ServiceChip(
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

class ServiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const ServiceChip({super.key, required this.label, this.isSelected = false});

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

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String duration;
  final String price;
  final IconData icon;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.serviceDetail),
      child: Container(
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFFEAF2FF),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primaryBlue, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                      ),
                      CustomPopupMenu(
                        deleteTitle: 'Delete Service',
                        deleteContent: 'Are you sure you want to delete this service? This action cannot be undone.',
                        onEdit: () {},
                        onDelete: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        duration,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAF2FF),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.sell,
                              size: 10,
                              color: AppColors.primaryBlue,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '₹ $price',
                              style: const TextStyle(
                                color: AppColors.primaryBlue,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
