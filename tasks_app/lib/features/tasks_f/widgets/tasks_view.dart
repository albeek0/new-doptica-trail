
import 'package:flutter/material.dart';
import 'package:tasks_app/core/widgets/custom_app_bar_new.dart';
import 'package:tasks_app/core/widgets/custome_container.dart';
import 'package:tasks_app/features/tasks_f/widgets/custom_float_action_botton.dart';
import 'package:tasks_app/features/tasks_f/widgets/tasks_view_body.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomeContainer(
        widget: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CuotomeAppBar(label: "Tasks",),
      floatingActionButton: CustomFloatActhion(),
      body: TasksViewBody(),
    ));
  }
}

