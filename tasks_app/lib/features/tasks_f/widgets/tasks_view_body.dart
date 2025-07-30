import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks_app/features/tasks_f/widgets/custom_row_filter.dart';
import 'package:tasks_app/features/tasks_f/widgets/custom_row_task.dart';

class TasksViewBody extends StatefulWidget {
  const TasksViewBody({super.key});

  @override
  State<TasksViewBody> createState() => _TasksViewBodyState();
}

class _TasksViewBodyState extends State<TasksViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomRowFilter(),
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                CustomRowTask(data: "To Do"),
                SizedBox(height: 20),
                CustomRowTask(data: "Doing"),
                SizedBox(height: 20),
                CustomRowTask(data: "Done"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
