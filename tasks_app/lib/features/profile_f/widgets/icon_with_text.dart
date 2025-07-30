import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_style.dart';

class IconWithText extends StatelessWidget {
  final IconData iconData;
  final String text;

  const IconWithText({super.key, required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Icon(color: Colors.white, iconData, size: 30),
          const SizedBox(
            width: 10,
          ), // Adjust spacing between icon and text as needed
          Text(text, style: AppStyles.styleOpenSansBold24),
        ],
      ),
    );
  }
}
