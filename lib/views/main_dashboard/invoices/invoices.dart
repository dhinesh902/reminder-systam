import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/routes/app_routes.dart';

class Invoices extends StatelessWidget {
  const Invoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(AppRoutes.addInvoice),
        backgroundColor: AppColors.primaryBlue,
        icon: const Icon(Icons.add, color: AppColors.white),
        label: const Text(
          "Create Invoice",
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const InvoiceHeader(),
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
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: const [
                          // Summary Cards
                          Row(
                            children: [
                              InvoiceSummaryCard(
                                title: "Total",
                                count: "48",
                                color: AppColors.lightBlue,
                              ),
                              SizedBox(width: 10),
                              InvoiceSummaryCard(
                                title: "Paid",
                                count: "37",
                                color: AppColors.darkGreen,
                              ),
                              SizedBox(width: 10),
                              InvoiceSummaryCard(
                                title: "Pending",
                                count: "8",
                                color: AppColors.orange,
                              ),
                              SizedBox(width: 10),
                              InvoiceSummaryCard(
                                title: "Overdue",
                                count: "3",
                                color: AppColors.darkRed,
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          // Search Bar
                          InvoiceSearchBar(),
                          SizedBox(height: 20),
                          // Filters
                          InvoiceFilterChips(),
                          SizedBox(height: 20),
                          // Invoice List
                          InvoiceListItem(
                            id: "INV-2025-001",
                            name: "Ramesh Kumar",
                            date: "15 Apr 2025",
                            amount: "₹ 2,500.00",
                            status: "Paid",
                            statusColor: AppColors.darkGreen,
                          ),
                          InvoiceListItem(
                            id: "INV-2025-002",
                            name: "Priya Sharma",
                            date: "14 Apr 2025",
                            amount: "₹ 1,800.00",
                            status: "Paid",
                            statusColor: AppColors.darkGreen,
                          ),
                          InvoiceListItem(
                            id: "INV-2025-003",
                            name: "Suresh Patel",
                            date: "12 Apr 2025",
                            amount: "₹ 3,200.00",
                            status: "Pending",
                            statusColor: AppColors.orange,
                          ),
                          InvoiceListItem(
                            id: "INV-2025-004",
                            name: "Anita Verma",
                            date: "10 Apr 2025",
                            amount: "₹ 2,750.00",
                            status: "Paid",
                            statusColor: AppColors.darkGreen,
                          ),
                          InvoiceListItem(
                            id: "INV-2025-005",
                            name: "Vikram Singh",
                            date: "08 Apr 2025",
                            amount: "₹ 1,450.00",
                            status: "Overdue",
                            statusColor: AppColors.darkRed,
                          ),
                          SizedBox(height: 80), // Padding for FAB
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

class InvoiceHeader extends StatelessWidget {
  const InvoiceHeader({super.key});

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
                'Invoices',
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

class InvoiceSummaryCard extends StatelessWidget {
  final String title;
  final String count;
  final Color color;

  const InvoiceSummaryCard({
    super.key,
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.receipt_long, color: color, size: 16),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InvoiceSearchBar extends StatelessWidget {
  const InvoiceSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: AppColors.grey, size: 22),
          SizedBox(width: 12),
          Text(
            'Search by invoice no, customer name...',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class InvoiceFilterChips extends StatelessWidget {
  const InvoiceFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: const [
          InvoiceFilterChip(label: "All", isSelected: true),
          InvoiceFilterChip(label: "Paid", isSelected: false),
          InvoiceFilterChip(label: "Pending", isSelected: false),
          InvoiceFilterChip(label: "Overdue", isSelected: false),
        ],
      ),
    );
  }
}

class InvoiceFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const InvoiceFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryBlue : AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? null : Border.all(color: AppColors.inputBorder),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? AppColors.white : AppColors.textSecondary,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
    );
  }
}

class InvoiceListItem extends StatelessWidget {
  final String id;
  final String name;
  final String date;
  final String amount;
  final String status;
  final Color statusColor;

  const InvoiceListItem({
    super.key,
    required this.id,
    required this.name,
    required this.date,
    required this.amount,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.viewInvoice),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
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
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.receipt, color: AppColors.primaryBlue),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    id,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
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
            const SizedBox(width: 12),
            const Icon(Icons.chevron_right, color: AppColors.grey),
          ],
        ),
      ),
    );
  }
}
