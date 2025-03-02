import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/text_style.dart';
import 'package:quran_app/core/theme/theme_mode.dart';
import 'package:quran_app/feature/prayer_time/data/model/prayer_time_model/pray_time_model.dart';
import 'package:quran_app/core/widget/conver_date.dart';

class PrayTimeWidget extends StatelessWidget {
  final PrayerTimeModel pray;
  final Color? color;
  const PrayTimeWidget({
    super.key,
    required this.pray,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                color: themeProvider.isDarkTheme
                    ? const Color(0xff121931)
                    : const Color(0xfff3f3f5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: secondColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      children: [
                        Text(
                          "${pray.date!.gregorian!.date} | ${pray.date!.hijri!.date!} | ",
                          style: Styles.textStyle16,
                        ),
                        Text(
                          pray.date!.hijri!.weekday!.ar!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimeAdanWidget(
                    title: "الفجر",
                    subTitle: pray.timings!.fajr!,
                  ),
                  TimeAdanWidget(
                    title: "الشروق",
                    subTitle: pray.timings!.sunrise!,
                  ),
                  TimeAdanWidget(
                    title: "الظهر",
                    subTitle: pray.timings!.dhuhr!,
                  ),
                  TimeAdanWidget(
                    title: "العصر",
                    subTitle: pray.timings!.asr!,
                  ),
                  TimeAdanWidget(
                    title: "المغرب",
                    subTitle: pray.timings!.maghrib!,
                  ),
                  TimeAdanWidget(
                    title: "العشاء",
                    subTitle: pray.timings!.isha!,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class TimeAdanWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const TimeAdanWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          convertTo12HourFormat(subTitle),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
