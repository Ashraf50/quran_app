import 'package:flutter/material.dart';
import 'package:quran_app/core/theme/text_style.dart';
import 'package:quran_app/feature/Home/data/model/quran_model/quran_model.dart';

class SurahDetailsWidget extends StatelessWidget {
  final QuranModel surah;
  const SurahDetailsWidget({
    super.key,
    required this.surah,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Image.asset("assets/img/details background.png"),
          Positioned(
            top: 70,
            left: 150,
            child: Column(
              children: [
                Text(
                  surah.name!,
                  style: Styles.textStyle26,
                ),
                Text(
                  surah.nameTranslation!,
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
                      "${surah.typeEn!} ",
                      style: Styles.textStyle14,
                    ),
                    Text(
                      "- ${surah.array!.length} VERSES",
                      style: Styles.textStyle14,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
