import 'package:flutter/material.dart';
import 'package:reminder/utils/constants/colors.dart';
import 'package:reminder/widgets/custom_dialogues.dart';

class CustomPopupMenu extends StatelessWidget {
  final String deleteTitle;
  final String deleteContent;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CustomPopupMenu({
    super.key,
    required this.deleteTitle,
    required this.deleteContent,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.more_vert_rounded,
        color: Colors.blueGrey,
        size: 20,
      ),
      padding: EdgeInsets.zero,
      color: AppColors.white,
      constraints: const BoxConstraints(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: (value) {
        if (value == 'edit') {
          onEdit();
        } else if (value == 'delete') {
          CustomDialogues.showDeleteConfirmationDialog(
            context,
            title: deleteTitle,
            content: deleteContent,
            onConfirm: onDelete,
          );
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'edit',
          child: Row(
            children: [
              Icon(Icons.edit_rounded, size: 18, color: Colors.blueGrey),
              SizedBox(width: 8),
              Text('Edit', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'delete',
          child: Row(
            children: [
              Icon(Icons.delete_rounded, size: 18, color: Colors.red),
              SizedBox(width: 8),
              Text('Delete', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}
