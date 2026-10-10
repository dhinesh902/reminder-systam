import 'package:flutter/material.dart';
import 'package:reminder/widgets/form_widgets.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  @override
  Widget build(BuildContext context) {
    return FormScreenLayout(
      title: 'Add Product',
      headerIcon: const Icon(Icons.inventory_2, size: 32, color: Colors.blue),
      headerTitle: 'Add New Product',
      headerSubtitle: 'Enter product details to manage\ninventory and sales.',
      buttonText: 'Save Product',
      onSave: () {},
      formFields: const [
        FormInputField(
          label: 'Product Name',
          isRequired: true,
          hintText: 'Enter product name',
          prefixIcon: Icons.inventory_2_outlined,
        ),
        FormInputField(
          label: 'Model No.',
          hintText: 'Enter model number',
          prefixIcon: Icons.tag,
        ),
        FormDropdownField(
          label: 'Category',
          isRequired: true,
          hintText: 'Select category',
          prefixIcon: Icons.category_outlined,
          items: ['Filter', 'Membrane', 'Pump', 'Full System'],
        ),
        FormInputField(
          label: 'Brand',
          hintText: 'Enter brand name',
          prefixIcon: Icons.branding_watermark_outlined,
        ),
        FormInputField(
          label: 'Unit Price',
          isRequired: true,
          hintText: 'Enter price',
          prefixIcon: Icons.currency_rupee,
          keyboardType: TextInputType.number,
        ),
        FormInputField(
          label: 'Quantity',
          isRequired: true,
          hintText: 'Enter quantity',
          prefixIcon: Icons.production_quantity_limits,
          keyboardType: TextInputType.number,
        ),
        FormDropdownField(
          label: 'GST (%)',
          hintText: 'Select GST rate',
          prefixIcon: Icons.percent,
          items: ['0%', '5%', '12%', '18%', '28%'],
        ),
        FormInputField(
          label: 'Warranty (Months)',
          hintText: 'Enter warranty period',
          prefixIcon: Icons.verified_user_outlined,
          keyboardType: TextInputType.number,
        ),
        FormInputField(
          label: 'Description',
          hintText: 'Enter product description',
          prefixIcon: Icons.description_outlined,
          maxLines: 3,
        ),
      ],
    );
  }
}
