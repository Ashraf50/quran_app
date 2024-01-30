import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constant/text_style.dart';
import 'package:quran_app/core/constant/theme_mode.dart';
import 'package:quran_app/core/utils/quran_model/surah_model.dart';

class SurahWidget extends StatelessWidget {
  final SurahModel surah;
  const SurahWidget({
    super.key,
    required this.surah,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset("assets/img/muslim.svg"),
                      Positioned(
                        left: 14,
                        top: 8,
                        child: Text(
                          textAlign: TextAlign.center,
                          surah.number.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: themeProvider.isDarkTheme
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        surah.englishName,
                        style: Styles.textStyle16,
                      ),
                      Row(
                        children: [
                          Text(
                            surah.revelationType,
                            style: Styles.textStyle12,
                          ),
                          Text(
                            "- ${surah.ayahs.length} verses",
                            style: Styles.textStyle12,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  surah.name,
                  style: Styles.textStyle20,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Divider(
              color: Color.fromARGB(135, 187, 196, 206),
            ),
          ), 
        ],
      ),
    );
  }
}
