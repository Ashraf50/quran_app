import 'package:flutter/material.dart';
import 'package:quran_app/core/theme/text_style.dart';
import 'package:quran_app/feature/prayer_time/data/model/prayer_time_model/pray_time_model.dart';

class AllMonthWidget extends StatelessWidget {
  final Color? color;
  final PrayerTimeModel pray;
  const AllMonthWidget({
    super.key,
    required this.pray,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        child: Column(
          children: [
            Text(
              pray.date!.gregorian!.weekday!.en!.substring(0, 3),
              style: Styles.textStyle16,
            ),
            Text(
              pray.date!.gregorian!.day!,
              style: Styles.textStyle16,
            ),
          ],
        ),
      ),
    );
  }
}
