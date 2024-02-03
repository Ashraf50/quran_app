import 'package:flutter/material.dart';
import 'package:quran_app/core/constant/text_style.dart';

class DailyPrayerWidget extends StatelessWidget {
  const DailyPrayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyWidget(
                      text: "الشروق",
                      time: "05:10",
                    ),
                    MyWidget(
                      text: "الفجر",
                      time: "05:10",
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyWidget(
                      text: "العصر",
                      time: "05:10",
                    ),
                    MyWidget(
                      text: "الظهر",
                      time: "05:10",
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyWidget(
                      text: "العشاء",
                      time: "05:10",
                    ),
                    MyWidget(
                      text: "المغرب",
                      time: "05:10",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final String text;
  final String time;
  const MyWidget({super.key, required this.text, required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            text,
            style: Styles.textStyle19,
          ),
        ),
        Text(
          time,
          style: Styles.textStyle19,
        ),
      ],
    );
  }
}
