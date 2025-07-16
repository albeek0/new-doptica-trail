import 'package:flutter/material.dart';
import 'package:tasks_app/features/tasks_f/widgets/Custom_botton.dart';


class CustomRowFilter extends StatelessWidget {
  const CustomRowFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Custombotton(
            data: " tasks",
            icon: Icons.check,
          ),
          SizedBox(
            width: 10,
          ),
          Custombotton(
            data: "filter",
            icon: Icons.filter_alt,
          ),
          SizedBox(
            width: 10,
          ),
          Custombotton(
            data: "Sort by",
            icon: Icons.sort,
          ),
        ],
      ),
    );
  }
}














  





