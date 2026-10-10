import 'package:flutter/material.dart';
import 'package:reminder/widgets/form_widgets.dart';

class AddServiceHistory extends StatefulWidget {
  const AddServiceHistory({super.key});

  @override
  State<AddServiceHistory> createState() => _AddServiceHistoryState();
}

class _AddServiceHistoryState extends State<AddServiceHistory> {
  @override
  Widget build(BuildContext context) {
    return FormScreenLayout(
      title: 'Add Service History',
      headerIcon: const Icon(Icons.history, size: 32, color: Colors.blue),
      headerTitle: 'Service Record',
      headerSubtitle: 'Log a past service or maintenance\nfor a customer.',
      buttonText: 'Save Service History',
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
          label: 'Service Type',
          isRequired: true,
          hintText: 'Select service type',
          prefixIcon: Icons.build_circle_outlined,
          items: ['RO Service (Annual)', 'Filter Cartridge Change', 'General Repair'],
        ),
        FormInputField(
          label: 'Service Date',
          isRequired: true,
          hintText: 'DD MMM YYYY',
          prefixIcon: Icons.calendar_today_outlined,
        ),
        FormDropdownField(
          label: 'Technician',
          isRequired: true,
          hintText: 'Select technician',
          prefixIcon: Icons.engineering_outlined,
          items: ['Amit Sharma', 'Rahul Singh', 'Vijay Kumar'],
        ),
        FormDropdownField(
          label: 'Status',
          hintText: 'Select status',
          prefixIcon: Icons.info_outline,
          items: ['Completed', 'Pending', 'Cancelled'],
        ),
        FormInputField(
          label: 'Remarks / Notes',
          hintText: 'Enter any remarks about the service...',
          prefixIcon: Icons.note_alt_outlined,
          maxLines: 3,
        ),
      ],
    );
  }
}
