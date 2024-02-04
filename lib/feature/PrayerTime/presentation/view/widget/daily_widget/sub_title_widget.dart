import 'package:flutter/material.dart';
import 'package:quran_app/core/constant/text_style.dart';
import 'package:quran_app/core/utils/prayer_time_model/pray_time_model.dart';
import 'package:quran_app/core/widget/conver_date.dart';

class SubTitleWidget extends StatelessWidget {
  final PrayerTimeModel pray;
  const SubTitleWidget({
    super.key,
    required this.pray,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyWidget(
                text: "الشروق",
                time: pray.timings!.sunrise!,
              ),
              MyWidget(
                text: "الفجر",
                time: pray.timings!.fajr!,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyWidget(
                text: "العصر",
                time: pray.timings!.asr!,
              ),
              MyWidget(
                text: "الظهر",
                time: pray.timings!.dhuhr!,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyWidget(
                text: "العشاء",
                time: pray.timings!.isha!,
              ),
              MyWidget(
                text: "المغرب",
                time: pray.timings!.maghrib!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final String text;
  final String time;
  const MyWidget({
    super.key,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            text,
            style: Styles.textStyle19,
          ),
        ),
        Text(
          convertTo12HourFormat(time),
          style: Styles.textStyle19,
        ),
      ],
    );
  }
}
