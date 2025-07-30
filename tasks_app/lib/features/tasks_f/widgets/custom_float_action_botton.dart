import 'package:flutter/material.dart';
import 'package:tasks_app/constans.dart';

class CustomFloatActhion extends StatelessWidget {
  const CustomFloatActhion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kButtonColor,
      ),
      height: 44,
      width: 44,

      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
