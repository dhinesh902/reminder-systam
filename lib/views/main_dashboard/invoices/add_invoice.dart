import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:go_router/go_router.dart';

class AddInvoice extends StatelessWidget {
  const AddInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const AddInvoiceHeader(),
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
                    const SizedBox(height: 8),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const InvoiceSectionHeader(icon: Icons.person, title: "Customer Details"),
                            const InvoiceCardContainer(
                              child: Column(
                                children: [
                                  InvoiceDropdown(label: "Select Customer *", value: "Ramesh Kumar (CUST-001)"),
                                  SizedBox(height: 16),
                                  InvoiceTextField(label: "Phone No.", hint: "+91 98765 43210"),
                                  SizedBox(height: 16),
                                  InvoiceTextField(label: "Customer Address", hint: "12, Green Park, New Delhi - 110016", maxLines: 2),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            const InvoiceSectionHeader(icon: Icons.receipt_long, title: "Invoice Details"),
                            const InvoiceCardContainer(
                              child: Column(
                                children: [
                                  InvoiceTextField(label: "Invoice No. *", hint: "INV-2025-011"),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(child: InvoiceTextField(label: "Invoice Date *", hint: "16 Apr 2025", icon: Icons.calendar_today)),
                                      SizedBox(width: 16),
                                      Expanded(child: InvoiceTextField(label: "Due Date *", hint: "30 Apr 2025", icon: Icons.calendar_today)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const InvoiceSectionHeader(icon: Icons.shopping_cart, title: "Items"),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryBlue,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  ),
                                  icon: const Icon(Icons.add, size: 16, color: AppColors.white),
                                  label: const Text("Add Item", style: TextStyle(color: AppColors.white, fontSize: 12)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            InvoiceCardContainer(
                              child: Column(
                                children: [
                                  // Table Header
                                  Row(
                                    children: const [
                                      Expanded(flex: 3, child: Text("Product / Service", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.black54))),
                                      Expanded(flex: 1, child: Text("Qty", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.black54))),
                                      Expanded(flex: 2, child: Text("Rate (₹)", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.black54))),
                                      Expanded(flex: 2, child: Text("Amount (₹)", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.black54))),
                                      SizedBox(width: 24),
                                    ],
                                  ),
                                  const Divider(height: 24),
                                  // Items
                                  const InvoiceItemRow(name: "RO Service (Annual)", qty: "1", rate: "1,500.00", amount: "1,500.00"),
                                  const SizedBox(height: 16),
                                  const InvoiceItemRow(name: "Filter Cartridge", qty: "2", rate: "350.00", amount: "700.00"),
                                  const Divider(height: 32),
                                  // Summary
                                  const InvoiceSummaryRow(label: "Subtotal", value: "₹ 2,200.00"),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Discount", style: TextStyle(color: AppColors.black54, fontSize: 13, fontWeight: FontWeight.w600)),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 60,
                                            height: 36,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                                                hintText: "0",
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          const Text("%", style: TextStyle(fontSize: 14)),
                                          const SizedBox(width: 24),
                                          const Text("₹ 0.00", style: TextStyle(fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  const InvoiceSummaryRow(label: "Tax (GST 18%)", value: "₹ 396.00"),
                                  const Divider(height: 32),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Total Amount", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: AppColors.textPrimary)),
                                      Text("₹ 2,596.00", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: AppColors.textPrimary)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            const InvoiceSectionHeader(icon: Icons.payment, title: "Payment Details"),
                            const InvoiceCardContainer(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: InvoiceDropdown(label: "Payment Status *", value: "Paid")),
                                      SizedBox(width: 16),
                                      Expanded(child: InvoiceDropdown(label: "Payment Method", value: "Cash")),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(child: InvoiceTextField(label: "Paid Amount (₹) *", hint: "2,596.00")),
                                      SizedBox(width: 16),
                                      Expanded(child: InvoiceTextField(label: "Payment Date", hint: "16 Apr 2025", icon: Icons.calendar_today)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            const InvoiceSectionHeader(icon: Icons.note_alt, title: "Notes"),
                            const InvoiceCardContainer(
                              child: InvoiceTextField(label: "", hint: "Additional notes (optional)...", maxLines: 3),
                            ),
                            const SizedBox(height: 32),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () => context.pop(),
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      side: const BorderSide(color: AppColors.primaryBlue),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    ),
                                    child: const Text("Cancel", style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      backgroundColor: AppColors.primaryBlue,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      elevation: 0,
                                    ),
                                    child: const Text("Save Invoice", style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
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

class AddInvoiceHeader extends StatelessWidget {
  const AddInvoiceHeader({super.key});

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
                child: const Icon(Icons.arrow_back, color: AppColors.white, size: 28),
              ),
              const SizedBox(width: 16),
              const Text(
                'Add Invoice',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const Icon(Icons.insert_drive_file_outlined, color: AppColors.white, size: 26),
        ],
      ),
    );
  }
}

class InvoiceSectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const InvoiceSectionHeader({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryBlue, size: 20),
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

class InvoiceCardContainer extends StatelessWidget {
  final Widget child;

  const InvoiceCardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: child,
    );
  }
}

class InvoiceDropdown extends StatelessWidget {
  final String label;
  final String value;

  const InvoiceDropdown({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.black87, fontWeight: FontWeight.w600)),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value, style: const TextStyle(fontSize: 14)),
              const Icon(Icons.keyboard_arrow_down, color: AppColors.grey),
            ],
          ),
        ),
      ],
    );
  }
}

class InvoiceTextField extends StatelessWidget {
  final String label;
  final String hint;
  final int maxLines;
  final IconData? icon;

  const InvoiceTextField({super.key, required this.label, required this.hint, this.maxLines = 1, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.black87, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
        ],
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
            suffixIcon: icon != null ? Icon(icon, color: AppColors.grey, size: 20) : null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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

class InvoiceItemRow extends StatelessWidget {
  final String name;
  final String qty;
  final String rate;
  final String amount;

  const InvoiceItemRow({super.key, required this.name, required this.qty, required this.rate, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text(name, style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, fontWeight: FontWeight.w500))),
        Expanded(flex: 1, child: Text(qty, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary))),
        Expanded(flex: 2, child: Text(rate, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary))),
        Expanded(flex: 2, child: Text(amount, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary))),
        const Icon(Icons.delete_outline, color: AppColors.darkRed, size: 20),
      ],
    );
  }
}

class InvoiceSummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const InvoiceSummaryRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppColors.black54, fontSize: 13, fontWeight: FontWeight.w600)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary)),
      ],
    );
  }
}
