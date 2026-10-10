import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';

class Customers extends StatelessWidget {
  const Customers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const CustomerHeader(),
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
                    const CustomerSearchBar(),
                    const SizedBox(height: 16),
                    const CustomerCategoryChips(),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          CustomerCard(
                            name: 'Rahul Sharma',
                            phone: '+91 98765 43210',
                            status: 'Active',
                            statusColor: Colors.teal,
                            statusBg: Colors.teal.withOpacity(0.1),
                            location: 'Sector 12, Noida',
                            device: 'AquaPure RO X1',
                            initials: 'RS',
                          ),
                          CustomerCard(
                            name: 'Priya Singh',
                            phone: '+91 87654 32109',
                            status: 'Active',
                            statusColor: Colors.teal,
                            statusBg: Colors.teal.withOpacity(0.1),
                            location: 'Indirapuram, Ghaziabad',
                            device: 'AquaPure RO X1',
                            initials: 'PS',
                          ),
                          CustomerCard(
                            name: 'Neha Verma',
                            phone: '+91 91234 56789',
                            status: 'Service Due',
                            statusColor: Colors.orange,
                            statusBg: Colors.orange.withOpacity(0.1),
                            location: 'Vasundhara, Ghaziabad',
                            device: 'AquaPure RO Pro',
                            initials: 'NV',
                          ),
                          CustomerCard(
                            name: 'Rohit Kumar',
                            phone: '+91 99887 66554',
                            status: 'Active',
                            statusColor: Colors.teal,
                            statusBg: Colors.teal.withOpacity(0.1),
                            location: 'Noida Sector 62',
                            device: 'AquaPure RO X1',
                            initials: 'RK',
                          ),
                          CustomerCard(
                            name: 'Sandeep Yadav',
                            phone: '+91 90011 22334',
                            status: 'Follow Up',
                            statusColor: Colors.blue,
                            statusBg: Colors.blue.withOpacity(0.1),
                            location: 'Greater Noida',
                            device: 'AquaPure RO Pro',
                            initials: 'SY',
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
    );
  }

}

class CustomerHeader extends StatelessWidget {
  const CustomerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.menu, color: AppColors.white, size: 28),
              SizedBox(width: 16),
              Text(
                'Customers',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.search, color: AppColors.white, size: 26),
              SizedBox(width: 16),
              Icon(Icons.filter_alt_outlined, color: AppColors.white, size: 26),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomerSearchBar extends StatelessWidget {
  const CustomerSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 15, offset: const Offset(0, 5)),
          ],
        ),
        child: Row(
          children: const [
            Icon(Icons.search, color: Colors.grey, size: 22),
            SizedBox(width: 12),
            Text('Search by name, phone or location...', style: TextStyle(color: Colors.black38, fontSize: 13, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

class CustomerCategoryChips extends StatelessWidget {
  const CustomerCategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: const [
          CustomerChip(label: 'All', isSelected: true),
          SizedBox(width: 12),
          CustomerChip(label: 'Active'),
          SizedBox(width: 12),
          CustomerChip(label: 'Pending Service'),
          SizedBox(width: 12),
          CustomerChip(label: 'Inactive'),
        ],
      ),
    );
  }
}

class CustomerChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CustomerChip({
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

class CustomerCard extends StatelessWidget {
  final String name;
  final String phone;
  final String status;
  final Color statusColor;
  final Color statusBg;
  final String location;
  final String device;
  final String initials;

  const CustomerCard({
    super.key,
    required this.name,
    required this.phone,
    required this.status,
    required this.statusColor,
    required this.statusBg,
    required this.location,
    required this.device,
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
                    const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(location, style: const TextStyle(fontSize: 11, color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.water_drop_outlined, size: 14, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text(device, style: const TextStyle(fontSize: 11, color: Colors.black54)),
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
