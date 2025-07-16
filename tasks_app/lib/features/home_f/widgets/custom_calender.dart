import 'package:flutter/material.dart';
import 'package:tasks_app/constans.dart';
import 'package:tasks_app/core/utils/app_style.dart';

class CustomCalender extends StatelessWidget {
  const CustomCalender({super.key});
  //

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 250,
      width: 320,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Calendar", style: AppStyles.styleOpenSansBold20),
                Icon(Icons.calendar_month, color: kIconsColor),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.70,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: const Color.fromARGB(
                    255,
                    2,
                    70,
                    125,
                  ), // selected date
                  onPrimary: Colors.white, // text on selected date
                  onSurface: Colors.white, // default digit (day) color
                ),
                textTheme: TextTheme(
                  bodyLarge: TextStyle(
                    color: Colors.red,
                  ), // not always effective
                ),
              ),
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                onDateChanged: (date) {
                  // Your logic
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
