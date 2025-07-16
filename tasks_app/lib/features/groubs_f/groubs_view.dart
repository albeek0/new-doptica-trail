
import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_style.dart';
import 'package:tasks_app/core/widgets/custom_app_bar_new.dart';
import 'package:tasks_app/core/widgets/custome_container.dart';

class GroubsView extends StatelessWidget {
  const GroubsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomeContainer(
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CuotomeAppBar(
          label: 'Groubs',
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  width: 400,
                  height: 300,
                  image: AssetImage(
                    "assets/images/groubs.png",
                  )),
              Text(
                "No Groubs Yet !",
                style: AppStyles.styleOpenSansBold24,
              )
            ],
          ),
        ),
      ),
    );
  }
}
