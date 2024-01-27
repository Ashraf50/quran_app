import 'package:flutter/material.dart';
import 'package:quran_app/core/constant/text_style.dart';
import 'package:quran_app/core/utils/quran_model/surah.dart';

class SurahDetailsWidget extends StatelessWidget {
  final SurahModel surah;

  const SurahDetailsWidget({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Image.asset("assets/img/details background.png"),
          Positioned(
            top: 70,
            left: 110,
            child: Column(
              children: [
                Text(
                  surah.englishName,
                  style: Styles.textStyle26,
                ),
                Text(
                  surah.englishNameTranslation,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      "${surah.revelationType} ",
                      style: Styles.textStyle14,
                    ),
                    Text(
                      "- ${surah.ayahs.length.toString()} VERSES",
                      style: Styles.textStyle14,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                 const Text(
                  "بسم الله الرحمن الرحيم",
                  style: Styles.textStyle24,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
