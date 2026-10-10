import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/utils/constants/colors.dart';

class ServiceDetail extends StatelessWidget {
  const ServiceDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: AppColors.primaryBlue,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(),
          ),
          title: const Text(
            'Service Detail',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        body: Column(
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEAF2FF),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(Icons.build, size: 30, color: AppColors.primaryBlue),
                    ),
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
                            const Expanded(
                              child: Text(
                                'RO Service (Annual)',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryBlue),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(20)),
                              child: const Text('Completed', style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text('Service ID: SRV-001', style: TextStyle(fontSize: 12, color: Colors.black54)),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 12, color: Colors.blueGrey),
                            const SizedBox(width: 6),
                            const Text('16 Apr 2025', style: TextStyle(fontSize: 11, color: Colors.black87, fontWeight: FontWeight.w500)),
                            const SizedBox(width: 12),
                            Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle)),
                            const SizedBox(width: 12),
                            const Icon(Icons.access_time, size: 12, color: Colors.blueGrey),
                            const SizedBox(width: 6),
                            const Text('09:30 AM', style: TextStyle(fontSize: 11, color: Colors.black87, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Icon(Icons.person, size: 14, color: Colors.blueGrey),
                            SizedBox(width: 6),
                            Text('Technician: Amit Sharma', style: TextStyle(fontSize: 12, color: Colors.black87)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Icon(Icons.settings, size: 14, color: Colors.blueGrey),
                            SizedBox(width: 6),
                            Text('Service Type: Annual Maintenance', style: TextStyle(fontSize: 12, color: Colors.black87)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),
            Expanded(
              child: _buildOverviewTab(),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.call, color: Colors.white, size: 18),
              label: const Text('Call Technician', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
            ),
          ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildInfoCard(
          title: 'Service Summary',
          icon: Icons.assignment,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Service Completed', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 13)),
                      SizedBox(height: 4),
                      Text('RO system checked and working properly.', style: TextStyle(color: Colors.black87, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildInfoCard(
          title: 'Service Details',
          icon: Icons.list_alt,
          child: Column(
            children: [
              _buildInfoRow('Service Type', 'Annual Maintenance'),
              _buildInfoRow('Service Date', '16 Apr 2025'),
              _buildInfoRow('Time', '09:30 AM'),
              _buildInfoRow('Technician', 'Amit Sharma'),
              _buildStatusRow('Status', 'Completed'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildInfoCard(
          title: 'Remarks',
          icon: Icons.note,
          child: const Text(
            'Filters cleaned and replaced. System performance is good. Advised next service after 12 months.',
            style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.5),
          ),
        ),
        const SizedBox(height: 20),
        _buildInfoCard(
          title: 'Products / Parts Used',
          icon: Icons.inventory_2,
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(flex: 2, child: Text('Product / Part', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54))),
                  Expanded(flex: 1, child: Text('Quantity', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54))),
                  Expanded(flex: 1, child: Text('Remarks', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54))),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(height: 1, color: Color(0xFFEEEEEE)),
              const SizedBox(height: 12),
              _buildPartsRow('Pre Filter', '1', 'Replaced'),
              _buildPartsRow('Carbon Filter', '1', 'Replaced'),
              _buildPartsRow('RO Membrane', '1', 'Checked', isLast: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPartsRow(String part, String qty, String remarks, {bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(part, style: const TextStyle(fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w500))),
          Expanded(flex: 1, child: Text(qty, style: const TextStyle(fontSize: 12, color: Colors.black87))),
          Expanded(flex: 1, child: Text(remarks, style: const TextStyle(fontSize: 12, color: Colors.black87))),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required String title, required IconData icon, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xFFF0F5FA),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Row(
              children: [
                Icon(icon, color: AppColors.primaryBlue, size: 18),
                const SizedBox(width: 8),
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryBlue, fontSize: 14)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: const TextStyle(color: Colors.black54, fontSize: 13)),
          ),
          Expanded(
            flex: 3,
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 13)),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String label, String status) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(label, style: const TextStyle(color: Colors.black54, fontSize: 13)),
        ),
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(20)),
              child: Text(status, style: const TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    );
  }
}
