import 'package:flutter/material.dart';
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
              title: "Prayer Timings",
              rightIcon: Icons.search,
              leftIcon: Icons.sort,
              rightIconOnTap: () {},
            ),
            const SizedBox(
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            const DailyPrayerWidget(),
          ],
        ),
      ),
    );
  }
}
