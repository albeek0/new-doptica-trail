import 'package:flutter/material.dart';
import 'package:tasks_app/constans.dart';

class CustomFloatActhion extends StatelessWidget {
  const CustomFloatActhion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      color: kSeconderyColor,
      child: IconButton(onPressed: () {}, icon: const Icon(Icons.battery_0_bar)),
    );
  }
}
