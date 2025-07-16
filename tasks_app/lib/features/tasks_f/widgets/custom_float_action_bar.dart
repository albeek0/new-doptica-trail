
import 'package:flutter/material.dart';
import 'package:tasks_app/constans.dart';

class CustomFloatActionBar extends StatelessWidget {
  const CustomFloatActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kSeconderyColor,
      onPressed: () {},
      child: const Icon(
        Icons.battery_0_bar,
        color: kIconsColor,
      ),
    );
  }
}
//