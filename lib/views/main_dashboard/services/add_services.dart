import 'package:flutter/material.dart';
import 'package:reminder/widgets/form_widgets.dart';

class AddServices extends StatefulWidget {
  const AddServices({super.key});

  @override
  State<AddServices> createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  @override
  Widget build(BuildContext context) {
    return FormScreenLayout(
      title: 'Add Service',
      headerIcon: const Icon(Icons.build, size: 32, color: Colors.blue),
      headerTitle: 'Add New Service',
      headerSubtitle: 'Enter service details to schedule\nand manage maintenance.',
      buttonText: 'Save Service',
      onSave: () {},
      formFields: const [
        FormInputField(
          label: 'Service Name',
          isRequired: true,
          hintText: 'Enter service name',
          prefixIcon: Icons.handyman_outlined,
        ),
        FormDropdownField(
          label: 'Category',
          isRequired: true,
          hintText: 'Select category',
          prefixIcon: Icons.category_outlined,
          items: ['Maintenance', 'Repair', 'Installation', 'Inspection'],
        ),
        FormDropdownField(
          label: 'Technician',
          hintText: 'Select technician',
          prefixIcon: Icons.person_outline,
          items: ['Amit Verma', 'Rahul Sharma', 'Suresh Kumar'],
        ),
        FormDropdownField(
          label: 'Service Type',
          hintText: 'Select service type',
          prefixIcon: Icons.settings_outlined,
          items: ['Annual', 'One-time', 'Emergency'],
        ),
        FormInputField(
          label: 'Duration (Hours)',
          hintText: 'Enter duration',
          prefixIcon: Icons.access_time_outlined,
          keyboardType: TextInputType.number,
        ),
        FormInputField(
          label: 'Price',
          isRequired: true,
          hintText: 'Enter service price',
          prefixIcon: Icons.currency_rupee,
          keyboardType: TextInputType.number,
        ),
        FormInputField(
          label: 'Description',
          hintText: 'Enter service description',
          prefixIcon: Icons.description_outlined,
          maxLines: 3,
        ),
      ],
    );
  }
}
