import 'package:flutter/material.dart';
import 'package:quran_app/core/constant/text_style.dart';
import 'package:quran_app/core/utils/quran_model/quran_model.dart';

class SurahDetailsWidget extends StatelessWidget {
  final QuranModel quran;
  const SurahDetailsWidget({
    super.key,
    required this.quran,
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
                  quran.nameTranslation!,
                  style: Styles.textStyle26,
                ),
                Text(
                  quran.nameEn!,
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
                      "${quran.typeEn!} ",
                      style: Styles.textStyle14,
                    ),
                    Text(
                      "- ${quran.array!.length.toString()} VERSES",
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
