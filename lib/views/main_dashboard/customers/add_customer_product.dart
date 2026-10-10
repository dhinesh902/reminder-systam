import 'package:flutter/material.dart';
import 'package:reminder/widgets/form_widgets.dart';

class AddCustomerProduct extends StatefulWidget {
  const AddCustomerProduct({super.key});

  @override
  State<AddCustomerProduct> createState() => _AddCustomerProductState();
}

class _AddCustomerProductState extends State<AddCustomerProduct> {
  @override
  Widget build(BuildContext context) {
    return FormScreenLayout(
      title: 'Add Customer Product',
      headerIcon: const Icon(Icons.inventory, size: 32, color: Colors.blue),
      headerTitle: 'Assign Product',
      headerSubtitle: 'Assign a product or machine\nto a specific customer.',
      buttonText: 'Save Product Assignment',
      onSave: () {},
      formFields: const [
        FormDropdownField(
          label: 'Customer',
          isRequired: true,
          hintText: 'Select customer',
          prefixIcon: Icons.person_outline,
          items: ['Ramesh Kumar (CUST-001)', 'Priya Singh (CUST-002)'],
        ),
        FormDropdownField(
          label: 'Product',
          isRequired: true,
          hintText: 'Select product',
          prefixIcon: Icons.inventory_2_outlined,
          items: ['RO Membrane', 'AquaGuard Reviva', 'Sediment Filter'],
        ),
        FormInputField(
          label: 'Serial Number / IMEI',
          hintText: 'Enter serial number',
          prefixIcon: Icons.qr_code_2,
        ),
        FormInputField(
          label: 'Purchase Date',
          isRequired: true,
          hintText: 'DD MMM YYYY',
          prefixIcon: Icons.calendar_month_outlined,
        ),
        FormInputField(
          label: 'Warranty Expiry Date',
          hintText: 'DD MMM YYYY',
          prefixIcon: Icons.verified_user_outlined,
        ),
        FormDropdownField(
          label: 'Status',
          hintText: 'Select status',
          prefixIcon: Icons.check_circle_outline,
          items: ['Active', 'Inactive', 'Under Repair'],
        ),
        FormInputField(
          label: 'Notes',
          hintText: 'Enter any additional details...',
          prefixIcon: Icons.description_outlined,
          maxLines: 3,
        ),
      ],
    );
  }
}
