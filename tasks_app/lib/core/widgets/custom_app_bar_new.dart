import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_style.dart';

class CuotomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(30);
  const CuotomeAppBar({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(label, style: AppStyles.styleOpenSansBold24),
      actions: [
        IconButton(
          icon: const Icon(Icons.density_medium, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}
