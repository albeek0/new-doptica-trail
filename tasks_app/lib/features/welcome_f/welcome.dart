
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_app/core/utils/app_router.dart';
import 'package:tasks_app/core/widgets/custome_container.dart';
import 'package:tasks_app/core/widgets/customebutton.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomeContainer(
      widget: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 65,
              ),
              Center(
                child: Image.asset(
                  fit: BoxFit.fill,
                  "assets/images/Logo Doptica f3.png",
                  height: 40,
                ),
              ),
              const SizedBox(
                height: 400,
              ),
              CustomeButton(
                ontap: () {
                  GoRouter.of(context).push(AppRouter.ksignup);
                },
                text: "sign up",
                color: const Color.fromARGB(200, 45, 123, 220),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: const Text(
                    "log in",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
