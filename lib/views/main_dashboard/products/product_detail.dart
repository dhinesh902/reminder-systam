import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/utils/constants/colors.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

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
            'Product Detail',
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
                    width: 90,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF2FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(Icons.water_drop, size: 40, color: AppColors.primaryBlue),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'RO Water Purifier',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryBlue),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'AquaFresh Pro',
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.check_circle, color: Colors.green, size: 12),
                              const SizedBox(width: 4),
                              const Text('In Stock', style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          '₹ 12,500.00',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: AppColors.primaryBlue),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.sell, size: 12, color: AppColors.primaryBlue),
                            const SizedBox(width: 4),
                            const Text('HSN: 8421', style: TextStyle(fontSize: 11, color: Colors.black54)),
                            const SizedBox(width: 16),
                            const Icon(Icons.inventory, size: 12, color: AppColors.primaryBlue),
                            const SizedBox(width: 4),
                            const Text('Brand: AquaTech', style: TextStyle(fontSize: 11, color: Colors.black54)),
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
              child: _buildDetailsTab(),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: Colors.white, size: 18),
              label: const Text('Edit Product', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
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

  Widget _buildDetailsTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildInfoCard(
          title: 'Product Information',
          icon: Icons.assignment,
          child: Column(
            children: [
              _buildInfoRow('Product Name', 'RO Water Purifier'),
              _buildInfoRow('Model', 'AquaFresh Pro'),
              _buildInfoRow('Category', 'Water Purifier'),
              _buildInfoRow('Brand', 'AquaTech'),
              _buildInfoRow('HSN Code', '8421'),
              _buildInfoRow('Purchase Price', '₹ 8,500.00'),
              _buildInfoRow('Selling Price', '₹ 12,500.00'),
              _buildInfoRow('Stock Quantity', '5'),
              _buildInfoRow('Unit', 'Piece', isLast: true),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildInfoCard(
          title: 'Description',
          icon: Icons.description,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Advanced RO technology with 7-stage purification for clean, safe and healthy drinking water. Removes dust, chlorine, bacteria and harmful impurities.',
                style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.5),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFeatureIcon(Icons.water_drop, '7 Stage\nPurification'),
                  _buildFeatureIcon(Icons.security, 'UV + UF\nProtection'),
                  _buildFeatureIcon(Icons.energy_savings_leaf, 'Energy\nEfficient'),
                  _buildFeatureIcon(Icons.health_and_safety, 'Healthy\n& Safe Water'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F5FA),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primaryBlue, size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 10, color: Colors.black54, height: 1.2),
        ),
      ],
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

  Widget _buildInfoRow(String label, String value, {bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
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
}
