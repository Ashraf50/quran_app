import 'package:flutter/material.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view/widget/azkar_app_bar.dart';
import 'package:quran_app/feature/prayer_time/presentation/view/widget/pray_time_list_view.dart';

class AllMonthPrayTimeView extends StatelessWidget {
  const AllMonthPrayTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          AzkarAppBar(
            title: "مواقيت الصلاه لشهر ${DateTime.now().month}",
            rightIcon: Icons.arrow_forward,
            rightIconOnTap: () {
              Navigator.pop(context);
            },
          ),
          const PrayTimeListView(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
