import 'package:flutter/material.dart';
import 'package:reminder/widgets/form_widgets.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return FormScreenLayout(
      title: 'Edit Profile',
      headerIcon: const Icon(Icons.manage_accounts, size: 32, color: Colors.blue),
      headerTitle: 'Update Profile',
      headerSubtitle: 'Update your personal details\nand manage your account.',
      buttonText: 'Save Changes',
      onSave: () {},
      formFields: const [
        FormInputField(
          label: 'Full Name',
          isRequired: true,
          hintText: 'Enter your full name',
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
      ],
    );
  }
}
