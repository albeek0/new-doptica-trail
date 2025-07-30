import 'package:flutter/material.dart';
import 'package:tasks_app/core/widgets/custom_app_bar_new.dart';
import 'package:tasks_app/core/widgets/custome_container.dart';
import 'package:tasks_app/features/home_f/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  // int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return const CustomeContainer(
      widget: Scaffold(
        appBar: CuotomeAppBar(label: "Home"),
        backgroundColor: Colors.transparent,
        body: HomeViewBody(),
      ),
    );
  }
}
