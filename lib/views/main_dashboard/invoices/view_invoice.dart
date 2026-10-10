import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:go_router/go_router.dart';

class ViewInvoice extends StatelessWidget {
  const ViewInvoice({super.key});

  void _showActionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.download, color: AppColors.primaryBlue),
                title: const Text('Download PDF', style: TextStyle(fontWeight: FontWeight.w600)),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.share, color: AppColors.primaryBlue),
                title: const Text('Share Invoice', style: TextStyle(fontWeight: FontWeight.w600)),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.print, color: AppColors.primaryBlue),
                title: const Text('Print Invoice', style: TextStyle(fontWeight: FontWeight.w600)),
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      side: const BorderSide(color: AppColors.inputBorder),
                    ),
                    child: const Text('Cancel', style: TextStyle(color: AppColors.black87, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textPrimary, // Dark background matching PDF viewer
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text("View Invoice", style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share, color: AppColors.white),
            onPressed: () => _showActionModal(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // PDF Toolbar
          Container(
            color: AppColors.textSecondary,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Icon(Icons.picture_as_pdf, color: AppColors.darkRed, size: 20),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    "Invoice_INV-2025-001.pdf",
                    style: TextStyle(color: AppColors.white, fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
                Text("1 / 1", style: TextStyle(color: AppColors.white.withOpacity(0.7), fontSize: 12)),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => _showActionModal(context),
                  child: const Icon(Icons.download, color: AppColors.white, size: 20),
                ),
              ],
            ),
          ),
          // PDF Document Viewer (Mocked)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 5)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.water_drop, color: AppColors.lightBlue, size: 30),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("RO Water Reminders", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: AppColors.primaryBlue)),
                                Text("Pure Water • Healthy Life", style: TextStyle(fontSize: 10, color: AppColors.black54)),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text("INVOICE", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.black87, letterSpacing: 1)),
                            Text("#INV-2025-001", style: TextStyle(fontSize: 12, color: AppColors.black54)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    // Details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Bill To:", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.black54)),
                            SizedBox(height: 4),
                            Text("Ramesh Kumar", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.black87)),
                            Text("12, Green Park, New Delhi - 110016", style: TextStyle(fontSize: 10, color: AppColors.black87)),
                            Text("Phone: +91 98765 43210", style: TextStyle(fontSize: 10, color: AppColors.black87)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: const [
                                Text("Invoice Date", style: TextStyle(fontSize: 10, color: AppColors.black54)),
                                SizedBox(width: 8),
                                Text(": 15 Apr 2025", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.black87)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: const [
                                Text("Due Date", style: TextStyle(fontSize: 10, color: AppColors.black54)),
                                SizedBox(width: 8),
                                Text(": 30 Apr 2025", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.black87)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Text("Payment Status", style: TextStyle(fontSize: 10, color: AppColors.black54)),
                                const SizedBox(width: 8),
                                const Text(": ", style: TextStyle(fontSize: 10, color: AppColors.black87)),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(color: AppColors.darkGreen.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                                  child: const Text("Paid", style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppColors.darkGreen)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Table Header
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      color: AppColors.primaryBlue.withOpacity(0.05),
                      child: Row(
                        children: const [
                          Expanded(flex: 1, child: Text("#", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                          Expanded(flex: 4, child: Text("Product / Service", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                          Expanded(flex: 1, child: Text("Qty", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                          Expanded(flex: 2, child: Text("Rate (₹)", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                          Expanded(flex: 2, child: Text("Amount (₹)", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.right)),
                        ],
                      ),
                    ),
                    // Table Rows
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Row(
                        children: const [
                          Expanded(flex: 1, child: Text("1", style: TextStyle(fontSize: 10))),
                          Expanded(flex: 4, child: Text("RO Service (Annual)", style: TextStyle(fontSize: 10))),
                          Expanded(flex: 1, child: Text("1", style: TextStyle(fontSize: 10))),
                          Expanded(flex: 2, child: Text("1,500.00", style: TextStyle(fontSize: 10))),
                          Expanded(flex: 2, child: Text("1,500.00", style: TextStyle(fontSize: 10), textAlign: TextAlign.right)),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: AppColors.inputBorder),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Row(
                        children: const [
                          Expanded(flex: 1, child: Text("2", style: TextStyle(fontSize: 10))),
                          Expanded(flex: 4, child: Text("Filter Cartridge", style: TextStyle(fontSize: 10))),
                          Expanded(flex: 1, child: Text("2", style: TextStyle(fontSize: 10))),
                          Expanded(flex: 2, child: Text("350.00", style: TextStyle(fontSize: 10))),
                          Expanded(flex: 2, child: Text("700.00", style: TextStyle(fontSize: 10), textAlign: TextAlign.right)),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: AppColors.inputBorder),
                    const SizedBox(height: 16),
                    // Totals
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Subtotal", style: TextStyle(fontSize: 10, color: AppColors.black54)),
                                  Text("2,200.00", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Tax (GST 18%)", style: TextStyle(fontSize: 10, color: AppColors.black54)),
                                  Text("396.00", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Divider(height: 1, color: AppColors.black87),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Total Amount", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.black87)),
                                  Text("2,596.00", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    const Text("Thank you for choosing RO Water Reminders!", style: TextStyle(fontSize: 9, color: AppColors.black54, fontStyle: FontStyle.italic)),
                    // Optional footer graphic
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
