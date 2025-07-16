import 'package:flutter/material.dart';
import 'package:tasks_app/constans.dart';

class CutomeNavBar extends StatelessWidget {
  const CutomeNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return NavigationBar(
      shadowColor: Colors.transparent,
      height: 60,
      selectedIndex: index,
      backgroundColor: Colors.transparent,
      indicatorColor: kPrimaryColor,
      // overlayColor: MaterialStatePropertyAll(Colors.transparent),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: "",
        ),
        NavigationDestination(icon: Icon(Icons.person), label: ""),
        NavigationDestination(icon: Icon(Icons.settings), label: ""),
        NavigationDestination(icon: Icon(Icons.task), label: "")
      ],
    );
  }
}
