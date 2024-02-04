import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constant/text_style.dart';
import 'package:quran_app/core/constant/theme_mode.dart';
import 'package:quran_app/core/utils/prayer_time_model/pray_time_model.dart';

class TitleWIdget extends StatelessWidget {
  final PrayerTimeModel pray;
  const TitleWIdget({
    super.key,
    required this.pray,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: themeProvider.isDarkTheme
            ? const Color(0xff121931)
            : const Color(0xfff3f3f5),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                pray.date!.hijri!.weekday!.ar!,
                style: Styles.textStyle19,
              ),
              Text(
                pray.date!.gregorian!.date!,
                style: Styles.textStyle19,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                pray.date!.hijri!.day!,
                style: Styles.textStyle19,
              ),
              Text(
                pray.date!.hijri!.month!.ar!,
                style: Styles.textStyle19,
              ),
            ],
          ),
        ],
      ),
    );
  }
}