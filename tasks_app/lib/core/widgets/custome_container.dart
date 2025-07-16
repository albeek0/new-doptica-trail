import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tasks_app/constans.dart';

class CustomeContainer extends StatelessWidget {
  const CustomeContainer({super.key, required this.widget});

  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.2, 0.7, 1],
          colors: [
            kSeconderyColor,
            kPrimaryColor,
            kPrimaryColor,
            kSeconderyColor,
          ],
        ),
      ),
      child: widget,
    );
  }
}
