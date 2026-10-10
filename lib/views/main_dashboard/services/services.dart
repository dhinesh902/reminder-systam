import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC), // premium subtle background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ServiceHeader(),
            const SizedBox(height: 24),
            const ServiceCategoryChips(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  ServiceCard(
                    title: 'General Service',
                    description: 'Complete purification system\ncheck-up and cleaning.',
                    price: '499',
                    icon: Icons.cleaning_services_rounded,
                  ),
                  ServiceCard(
                    title: 'Filter Replacement',
                    description: 'Genuine filters for better\nperformance.',
                    price: '999',
                    icon: Icons.filter_alt_rounded,
                  ),
                  ServiceCard(
                    title: 'RO Membrane Replacement',
                    description: 'Original RO membrane with\ninstallation.',
                    price: '2,499',
                    icon: Icons.water_drop_rounded,
                  ),
                  ServiceCard(
                    title: 'AMC (Annual Contract)',
                    description: 'Hassle-free service for a year.',
                    price: '1,999',
                    icon: Icons.handyman_rounded,
                  ),
                  ServiceCard(
                    title: 'Water Quality Check',
                    description: 'Professional TDS and purification\nlevel check.',
                    price: '199',
                    icon: Icons.science_rounded,
                  ),
                  ServiceCard(
                    title: 'Repair & Troubleshooting',
                    description: 'Quick resolution for any issue.',
                    price: '299',
                    icon: Icons.build_circle_outlined,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceHeader extends StatelessWidget {
  const ServiceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: AppColors.primaryBlue.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: const Icon(Icons.arrow_back_ios_new, color: AppColors.primaryBlue, size: 16),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Services',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primaryBlue,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Keep Your Purifier Healthy & Performing',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceCategoryChips extends StatelessWidget {
  const ServiceCategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: const [
          ServiceChip(label: 'All Services', isSelected: true),
          SizedBox(width: 12),
          ServiceChip(label: 'Routine Service'),
          SizedBox(width: 12),
          ServiceChip(label: 'Repairs'),
          SizedBox(width: 12),
          ServiceChip(label: 'Installation'),
        ],
      ),
    );
  }
}

class ServiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const ServiceChip({
    super.key,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        gradient: isSelected
            ? const LinearGradient(colors: [AppColors.lightBlue, AppColors.primaryBlue])
            : null,
        color: isSelected ? null : AppColors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: isSelected
            ? [BoxShadow(color: AppColors.primaryBlue.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))]
            : [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 5, offset: const Offset(0, 2))],
        border: isSelected ? null : Border.all(color: Colors.grey.shade200),
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
  final String price;
  final IconData icon;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFF0F5FB), Color(0xFFE2EDF8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: AppColors.primaryBlue.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: Icon(icon, size: 34, color: AppColors.primaryBlue),
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
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black54),
                ),
                const SizedBox(height: 12),
                Text(
                  'From ₹ $price',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_forward_ios, color: AppColors.primaryBlue, size: 14),
          ),
        ],
      ),
    );
  }
}
