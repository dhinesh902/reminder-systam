import 'package:flutter/material.dart';
import 'package:reminder/widgets/form_widgets.dart';

class AddCustomers extends StatefulWidget {
  const AddCustomers({super.key});

  @override
  State<AddCustomers> createState() => _AddCustomersState();
}

class _AddCustomersState extends State<AddCustomers> {
  @override
  Widget build(BuildContext context) {
    return FormScreenLayout(
      title: 'Add Customer',
      headerIcon: const Icon(Icons.person, size: 32, color: Colors.blue),
      headerTitle: 'Add New Customer',
      headerSubtitle: 'Enter customer details to register\nand manage their services.',
      buttonText: 'Save Customer',
      onSave: () {},
      formFields: const [
        FormInputField(
          label: 'Full Name',
          isRequired: true,
          hintText: 'Enter customer name',
          prefixIcon: Icons.person_outline,
        ),
        FormInputField(
          label: 'Mobile Number',
          isRequired: true,
          hintText: '+91 98765 43210',
          prefixIcon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
        ),
        FormInputField(
          label: 'Email Address',
          hintText: 'example@domain.com',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        FormInputField(
          label: 'Address',
          hintText: 'Enter full address',
          prefixIcon: Icons.location_on_outlined,
          maxLines: 3,
        ),
        FormInputField(
          label: 'City',
          hintText: 'Enter city',
          prefixIcon: Icons.location_city_outlined,
        ),
        FormDropdownField(
          label: 'State',
          hintText: 'Select state',
          prefixIcon: Icons.map_outlined,
          items: ['Karnataka', 'Maharashtra', 'Delhi', 'Tamil Nadu'],
        ),
        FormInputField(
          label: 'Pin Code',
          hintText: 'Enter pin code',
          prefixIcon: Icons.pin_drop_outlined,
          keyboardType: TextInputType.number,
        ),
        FormDropdownField(
          label: 'Customer Type',
          hintText: 'Regular',
          prefixIcon: Icons.person_outline,
          items: ['Regular', 'Premium', 'Corporate'],
        ),
      ],
    );
  }
}
