import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:reminder/routes/app_routes.dart';
import 'package:reminder/widgets/custom_dialogues.dart';
import 'package:reminder/widgets/add_button.dart';
import 'package:reminder/widgets/custom_search_bar.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const ProductHeader(),
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
                    const CustomSearchBar(hintText: "Search products..."),
                    const SizedBox(height: 16),
                    const ProductCategoryChips(),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 150),
                        children: const [
                          ProductCard(
                            title: 'RO Water Purifier',
                            subtitle: 'AquaFresh Pro',
                            price: '12,500.00',
                            category: 'RO Purifier',
                            icon: Icons.water_drop,
                            inStock: true,
                          ),
                          ProductCard(
                            title: 'Sediment Filter',
                            subtitle: '10 Inch',
                            price: '350.00',
                            category: 'Filter',
                            icon: Icons.filter_alt,
                            inStock: true,
                          ),
                          ProductCard(
                            title: 'Carbon Filter',
                            subtitle: '10 Inch',
                            price: '450.00',
                            category: 'Filter',
                            icon: Icons.kitchen,
                            inStock: true,
                          ),
                          ProductCard(
                            title: 'RO Membrane',
                            subtitle: '75 GPD',
                            price: '1,800.00',
                            category: 'Spare Parts',
                            icon: Icons.settings_input_component,
                            inStock: true,
                          ),
                          ProductCard(
                            title: 'Post Carbon Filter',
                            subtitle: '10 Inch',
                            price: '400.00',
                            category: 'Filter',
                            icon: Icons.layers,
                            inStock: true,
                          ),
                          ProductCard(
                            title: 'Booster Pump',
                            subtitle: '100 PSI',
                            price: '2,500.00',
                            category: 'Spare Parts',
                            icon: Icons.power,
                            inStock: true,
                          ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: CustomFloatingAddButton(
        padding: const EdgeInsets.only(bottom: 70),
        title: "Add Product",
        onTap: () {
          // context.push(AppRoutes.addProduct);
        },
      ),
    );
  }
}

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

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
                child: const Icon(Icons.arrow_back, color: AppColors.white),
              ),
              const SizedBox(width: 16),
              const Text(
                'Products',
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

class ProductCategoryChips extends StatefulWidget {
  const ProductCategoryChips({super.key});

  @override
  State<ProductCategoryChips> createState() => _ProductCategoryChipsState();
}

class _ProductCategoryChipsState extends State<ProductCategoryChips> {
  String selectedChip = 'All';
  final List<String> chips = [
    'All',
    'RO Purifiers',
    'Filters',
    'Spare Parts',
    'Accessories',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: chips.map((label) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedChip = label;
                });
              },
              child: ProductChip(
                label: label,
                isSelected: selectedChip == label,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ProductChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const ProductChip({super.key, required this.label, this.isSelected = false});

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

class ProductCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String category;
  final IconData icon;
  final bool inStock;

  const ProductCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.category,
    required this.icon,
    required this.inStock,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.productDetail),
      child: Container(
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
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF2FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.primaryBlue, size: 30),
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
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.primaryBlue),
                        ),
                      ),
                      if (inStock)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.check_circle, color: Colors.green, size: 10),
                              SizedBox(width: 2),
                              Text('In Stock', style: TextStyle(color: Colors.green, fontSize: 9, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      const SizedBox(width: 8),
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert, color: Colors.blueGrey, size: 18),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onSelected: (value) {
                          if (value == 'delete') {
                            CustomDialogues.showDeleteConfirmationDialog(
                              context,
                              title: 'Delete Product',
                              content: 'Are you sure you want to delete this product? This action cannot be undone.',
                              onConfirm: () {},
                            );
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(value: 'edit', child: Text('Edit')),
                          const PopupMenuItem(value: 'delete', child: Text('Delete', style: TextStyle(color: Colors.red))),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  const SizedBox(height: 8),
                  Text('₹ $price', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: AppColors.primaryBlue)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF2FF),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(category, style: const TextStyle(color: AppColors.primaryBlue, fontSize: 10, fontWeight: FontWeight.w500)),
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
