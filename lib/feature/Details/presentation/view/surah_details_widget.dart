import 'package:flutter/material.dart';
import 'package:quran_app/core/constant/text_style.dart';

class SurahDetailsWidget extends StatelessWidget {
  const SurahDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Image.asset("assets/img/details background.png"),
          const Positioned(
            top: 70,
            left: 110,
            child: Column(
              children: [
                Text(
                  "Al-Fatiah",
                  style: Styles.textStyle26,
                ),
                Text(
                  "The opening",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      "MECCAN ",
                      style: Styles.textStyle14,
                    ),
                    Text(
                      "- 7 VERSES",
                      style: Styles.textStyle14,
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
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
