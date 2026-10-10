import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/routes/app_routes.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:reminder/widgets/add_button.dart';
import 'package:reminder/widgets/custom_search_bar.dart';
import 'package:reminder/utils/date/dateutils.dart';
import 'package:reminder/utils/custom_launchers.dart';
import 'package:reminder/widgets/custom_popup_menu.dart';
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
    return InkWell(
      onTap: () {
        context.push(AppRoutes.customerDetail);
      },
      borderRadius: BorderRadius.circular(24),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textPrimary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
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
                      ),
                      // Action Buttons
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(width: 4),
                          CustomPopupMenu(
                            deleteTitle: 'Delete Customer',
                            deleteContent:
                                'Are you sure you want to delete this customer? This action cannot be undone.',
                            onEdit: () {},
                            onDelete: () {},
                          ),
                          Row(
                            children: [
                              BuildActionCallButton(
                                icon: Icons.call_rounded,
                                color: Colors.blue.shade600,
                                bgColor: Colors.blue.shade50,
                                onTap: () => openCall(phone),
                              ),
                              const SizedBox(width: 10),
                              BuildActionWhatsapp(
                                imageUrl:
                                    "https://cdn-icons-png.flaticon.com/128/3670/3670051.png",
                                bgColor: Colors.green.shade50,
                                onTap: () => openWhatsApp(phone),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.inputBackground,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_rounded,
                                size: 14,
                                color: AppColors.primaryBlue,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  location,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textSecondary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 14,
                          color: Colors.grey.withValues(alpha: 0.3),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.water_drop_rounded,
                              size: 14,
                              color: Colors.lightBlue,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              device,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textSecondary,
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
          ],
        ),
      ),
    );
  }
}

class BuildActionCallButton extends StatelessWidget {
  const BuildActionCallButton({
    super.key,
    required this.icon,
    required this.color,
    required this.bgColor,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final Color bgColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Icon(icon, color: color, size: 18),
      ),
    );
  }
}

class BuildActionWhatsapp extends StatelessWidget {
  const BuildActionWhatsapp({
    super.key,
    required this.imageUrl,
    required this.bgColor,
    required this.onTap,
  });

  final String imageUrl;
  final Color bgColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Image.network(imageUrl, height: 18, width: 18),
      ),
    );
  }
}
