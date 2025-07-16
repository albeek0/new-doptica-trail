import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:tasks_app/features/home_f/widgets/custom_calender.dart';
import 'package:tasks_app/features/home_f/widgets/custom_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          SizedBox(height: 325, child: CoustomGridView()),
          const CustomCalender(),
        ],
      ),
    );
  }
}
