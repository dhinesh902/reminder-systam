import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/widgets/premium_sliver_app_bar.dart';

class AddFollowup extends StatelessWidget {
  const AddFollowup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.inputBackground,
      appBar: const PremiumSliverAppBar(title: 'Add Followup'),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FollowupSectionHeader(
                    icon: Icons.person,
                    title: "Customer Details",
                  ),
                  FollowupCardContainer(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
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
                              const Text(
                                'Ramesh Kumar',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'CUST-001',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.phone,
                                    size: 14,
                                    color: AppColors.primaryBlue,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '+91 98765 43210',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Icon(
                                    Icons.location_on,
                                    size: 14,
                                    color: AppColors.primaryBlue,
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      '12, Green Park, New Delhi - 110016',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textSecondary,
                                      ),
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
                  const SizedBox(height: 24),
                  const FollowupSectionHeader(
                    icon: Icons.calendar_month,
                    title: "Followup Details",
                  ),
                  const FollowupCardContainer(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: FollowupTextField(
                                label: "Followup Date *",
                                hint: "18 Apr 2025",
                                icon: Icons.keyboard_arrow_down,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: FollowupTextField(
                                label: "Followup Time *",
                                hint: "10:00 AM",
                                icon: Icons.keyboard_arrow_down,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        FollowupDropdown(
                          label: "Followup Type *",
                          value: "Call",
                        ),
                        SizedBox(height: 16),
                        FollowupDropdown(
                          label: "Reminder",
                          value: "1 day before",
                          icon: Icons.notifications_none,
                        ),
                        SizedBox(height: 16),
                        FollowupDropdown(label: "Status *", value: "Pending"),
                        SizedBox(height: 16),
                        FollowupTextField(
                          label: "Notes / Remarks",
                          hint: "Enter followup notes or remarks...",
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const FollowupSectionHeader(
                    icon: Icons.edit_calendar,
                    title: "Next Followup (Optional)",
                  ),
                  const FollowupCardContainer(
                    child: Row(
                      children: [
                        Expanded(
                          child: FollowupTextField(
                            label: "Date",
                            hint: "25 Apr 2025",
                            icon: Icons.calendar_today,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: FollowupTextField(
                            label: "Time",
                            hint: "10:00 AM",
                            icon: Icons.access_time,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: AppColors.primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.save, color: Colors.white, size: 20),
                          SizedBox(width: 8),
                          Text(
                            "Save Followup",
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddFollowupHeader extends StatelessWidget {
  const AddFollowupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                'Add Followup',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const Icon(Icons.edit_calendar, color: AppColors.white, size: 26),
        ],
      ),
    );
  }
}

class FollowupSectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const FollowupSectionHeader({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryBlue, size: 20),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class FollowupCardContainer extends StatelessWidget {
  final Widget child;

  const FollowupCardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

class FollowupDropdown extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;

  const FollowupDropdown({
    super.key,
    required this.label,
    required this.value,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.inputBorder),
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white,
          ),
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: AppColors.primaryBlue, size: 20),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(value, style: const TextStyle(fontSize: 14)),
              ),
              const Icon(Icons.keyboard_arrow_down, color: AppColors.grey),
            ],
          ),
        ),
      ],
    );
  }
}

class FollowupTextField extends StatelessWidget {
  final String label;
  final String hint;
  final int maxLines;
  final IconData? icon;

  const FollowupTextField({
    super.key,
    required this.label,
    required this.hint,
    this.maxLines = 1,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
            suffixIcon: icon != null
                ? Icon(icon, color: AppColors.grey, size: 20)
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.inputBorder),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryBlue),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: AppColors.white,
          ),
        ),
      ],
    );
  }
}
