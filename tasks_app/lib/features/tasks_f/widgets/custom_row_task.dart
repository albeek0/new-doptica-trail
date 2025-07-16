import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_style.dart';

class CustomRowTask extends StatelessWidget {
  const CustomRowTask({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          data,
          style: AppStyles.styleOpenSansRegular24,
        ),
        const Icon(Icons.expand_more)
      ],
    );
  }
}
