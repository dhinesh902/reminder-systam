import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:reminder/widgets/premium_sliver_app_bar.dart';

class ServiceHistoryDetail extends StatelessWidget {
  const ServiceHistoryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.inputBackground,
      appBar: const PremiumSliverAppBar(title: "Service History Details"),
      body: Column(
        children: [
          // Header Section: Customer Profile
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryBlue.withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
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
                    child: Text(
                      'RK',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryBlue,
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
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Customer ID: CUST-001',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Icon(Icons.phone, size: 14, color: Colors.blueGrey),
                          SizedBox(width: 6),
                          Text(
                            '+91 98765 43210',
                            style: TextStyle(fontSize: 12, color: Colors.black87),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.location_on, size: 14, color: Colors.blueGrey),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              '123, Green Park, Delhi - 110016',
                              style: TextStyle(fontSize: 12, color: Colors.black87),
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
          Expanded(child: _buildServicesList()),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.print, color: Colors.white, size: 20),
            label: const Text(
              'Print History Report',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              shadowColor: AppColors.primaryBlue.withValues(alpha: 0.4),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildServicesList() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      children: [
        const Text(
          'Completed Services',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlue,
          ),
        ),
        const SizedBox(height: 16),
        _buildServiceRecordCard(
          serviceName: 'RO Service (Annual)',
          date: '16 Apr 2025',
          status: 'Completed',
          technician: 'Amit Sharma',
          parts: [
            {'name': 'Sediment Filter', 'qty': '1', 'price': '₹ 450'},
            {'name': 'Carbon Filter', 'qty': '1', 'price': '₹ 550'},
            {'name': 'Service Charge', 'qty': '-', 'price': '₹ 300'},
          ],
          total: '₹ 1,300',
        ),
        const SizedBox(height: 16),
        _buildServiceRecordCard(
          serviceName: 'Filter Cartridge Change',
          date: '17 Oct 2024',
          status: 'Completed',
          technician: 'Rahul Singh',
          parts: [
            {'name': 'Pre Filter', 'qty': '1', 'price': '₹ 250'},
            {'name': 'Service Charge', 'qty': '-', 'price': '₹ 200'},
          ],
          total: '₹ 450',
        ),
        const SizedBox(height: 24),
        // Grand Total Section
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primaryBlue, Color(0xFF1E3A8A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryBlue.withValues(alpha: 0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Total Services Cost',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '2 Services Completed',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Text(
                '₹ 1,750',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildServiceRecordCard({
    required String serviceName,
    required String date,
    required String status,
    required String technician,
    required List<Map<String, String>> parts,
    required String total,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withValues(alpha: 0.03),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Icons.build, color: AppColors.primaryBlue, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          serviceName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryBlue,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 14, color: Colors.blueGrey),
                        const SizedBox(width: 6),
                        Text(
                          date,
                          style: const TextStyle(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.person, size: 14, color: Colors.blueGrey),
                        const SizedBox(width: 6),
                        Text(
                          technician,
                          style: const TextStyle(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Products / Parts Used',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Expanded(flex: 2, child: Text('Item', style: TextStyle(fontSize: 11, color: Colors.black54, fontWeight: FontWeight.bold))),
                    Expanded(flex: 1, child: Text('Qty', style: TextStyle(fontSize: 11, color: Colors.black54, fontWeight: FontWeight.bold))),
                    Expanded(flex: 1, child: Text('Price', style: TextStyle(fontSize: 11, color: Colors.black54, fontWeight: FontWeight.bold))),
                  ],
                ),
                const Divider(height: 16),
                ...parts.map((part) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Expanded(flex: 2, child: Text(part['name']!, style: const TextStyle(fontSize: 13, color: Colors.black87))),
                      Expanded(flex: 1, child: Text(part['qty']!, style: const TextStyle(fontSize: 13, color: Colors.black87))),
                      Expanded(flex: 1, child: Text(part['price']!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87))),
                    ],
                  ),
                )),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(height: 1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Service Total',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.primaryBlue),
                    ),
                    Text(
                      total,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryBlue),
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
