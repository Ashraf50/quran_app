import 'package:flutter/material.dart';
import 'package:quran_app/feature/PrayerTime/presentation/view/widget/pray_time_widget.dart';

class PrayTimeListView extends StatelessWidget {
  const PrayTimeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const PrayTimeWidget();
      },
    );
  }
}
