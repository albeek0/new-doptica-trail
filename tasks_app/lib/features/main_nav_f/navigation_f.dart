import 'package:flutter/material.dart';
import 'package:tasks_app/constans.dart';
import 'package:tasks_app/core/utils/app_style.dart';
import 'package:tasks_app/features/groubs_f/groubs_view.dart';
import 'package:tasks_app/features/home_f/home_view.dart' show HomeView;
import 'package:tasks_app/features/posts_f/posts_screen.dart';
import 'package:tasks_app/features/tasks_f/widgets/tasks_view.dart'
    show TasksView;

class NavitagationView extends StatefulWidget {
  const NavitagationView({super.key});

  @override
  State<NavitagationView> createState() => _NavitagationViewState();
}

class _NavitagationViewState extends State<NavitagationView> {
  navtext(String txt) {
    return Text(txt, style: AppStyles.styleOpenSansBold14);
  }

  int selected = 0;
  List<Widget> listWidgets = const [
    HomeView(),
    GroubsView(),
    PostsScreen(),
    TasksView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: kSeconderyColor,
          indicatorColor: kPrimaryColor,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (states) => const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
            (states) => const IconThemeData(color: kIconsColor),
          ),
        ),
        child: NavigationBar(
          
          selectedIndex: selected,
          onDestinationSelected: (value) {
            setState(() {
              selected = value;
            });
          },
          animationDuration: const Duration(seconds: 1),
          height: 60,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.group), label: 'Groupes'),
            NavigationDestination(
              icon: Icon(Icons.newspaper_outlined),
              label: "Posts",
            ),
            NavigationDestination(icon: Icon(Icons.task), label: "Tasks"),
          ],
        ),
      ),
      body: listWidgets[selected],
    );
  }
}
