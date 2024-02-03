import 'package:flutter/material.dart';
import 'package:quran_app/core/constant/text_style.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/feature/PrayerTime/presentation/view/widget/daily_prayer_widget.dart';

class PrayTimeViewBody extends StatelessWidget {
  const PrayTimeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomAppBar(
            title: "PrayTime",
            rightIcon: Icons.search,
            leftIcon: Icons.sort,
            rightIconOnTap: () {},
          ),
          const SizedBox(
            height: 100,
          ),
          Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Thursday",
                        style: Styles.textStyle19,
                      ),
                      Text(
                        "01 Feb 2024",
                        style: Styles.textStyle19,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "21",
                        style: Styles.textStyle19,
                      ),
                      Text(
                        "Rajab",
                        style: Styles.textStyle19,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const DailyPrayerWidget(),
              ElevatedButton(
                onPressed: () {},
                child: const Text("View Time All month"),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
