import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/routes/app_routes.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:reminder/widgets/add_button.dart';
import 'package:reminder/widgets/custom_search_bar.dart';
import 'package:reminder/utils/date/dateutils.dart';
import 'package:reminder/utils/custom_launchers.dart';
import 'package:intl/intl.dart';

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
                    const CustomSearchBar(
                      hintText: 'Search by name, phone or location...',
                    ),
                    const SizedBox(height: 16),
                    const CustomerDateFilter(),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 150),
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return CustomerCard(
                            name: 'Rahul Sharma',
                            phone: '+91 98765 43210',
                            location: 'Sector 12, Noida',
                            device: 'AquaPure RO X1',
                            initials: 'RS',
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
        title: "Add Customer",
        onTap: () {
          context.push(AppRoutes.addCustomer);
        },
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
            children: [
              Image.network(
                "https://cdn-icons-png.flaticon.com/128/166/166258.png",
                height: 28,
              ),
              SizedBox(width: 15),
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
        ],
      ),
    );
  }
}

class CustomerDateFilter extends StatefulWidget {
  const CustomerDateFilter({super.key});

  @override
  State<CustomerDateFilter> createState() => _CustomerDateFilterState();
}

class _CustomerDateFilterState extends State<CustomerDateFilter> {
  DateTime? fromDate;
  DateTime? toDate;

  String _formatDate(DateTime? date, String defaultLabel) {
    if (date == null) return defaultLabel;
    return DateFormat('dd-MM-yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: DateFieldItem(
              label: _formatDate(fromDate, 'From Date'),
              onDateSelected: (date) {
                if (date != null) setState(() => fromDate = date);
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: DateFieldItem(
              label: _formatDate(toDate, 'To Date'),
              onDateSelected: (date) {
                if (date != null) setState(() => toDate = date);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DateFieldItem extends StatelessWidget {
  final String label;
  final ValueChanged<DateTime?>? onDateSelected;

  const DateFieldItem({super.key, required this.label, this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final date = await selectGlobalDate(context);
        if (onDateSelected != null) {
          onDateSelected!(date);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(
              Icons.calendar_today,
              size: 16,
              color: AppColors.primaryBlue,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomerCard extends StatelessWidget {
  final String name;
  final String phone;
  final String location;
  final String device;
  final String initials;

  const CustomerCard({
    super.key,
    required this.name,
    required this.phone,
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
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => openCall(phone),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.call,
                              color: Colors.blue.shade700,
                              size: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => openWhatsApp(phone),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              "https://cdn-icons-png.flaticon.com/128/3670/3670051.png",
                              height: 16,
                              width: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  phone,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.water_drop_outlined,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          device,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.grey,
                    ),
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
