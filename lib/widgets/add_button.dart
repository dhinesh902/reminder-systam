import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';

class CustomFloatingAddButton extends StatelessWidget {
  const CustomFloatingAddButton({
    super.key,
    required this.title,
    required this.onTap,
    this.padding = EdgeInsetsGeometry.zero,
  });

  final String title;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: FloatingActionButton.extended(
        onPressed: onTap,
        backgroundColor: AppColors.primaryBlue,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        icon: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            CupertinoIcons.add,
            color: AppColors.white,
            size: 15,
          ),
        ),
        label: Text(
          title,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
