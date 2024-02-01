import 'package:flutter/material.dart';
import 'package:quran_app/core/constant/colors.dart';
import 'package:quran_app/core/utils/hadith_model/hadith_model.dart';

class HadithWidget extends StatelessWidget {
  final HadithModel hadith;
  const HadithWidget({super.key, required this.hadith});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(31, 18, 25, 49),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: secondColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_border,
                    color: secondColor,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                hadith.arab,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
