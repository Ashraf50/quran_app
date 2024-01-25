import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constant/text_style.dart';
import 'package:quran_app/core/constant/theme_mode.dart';
import 'package:quran_app/core/utils/quran_model/quran_model.dart';

class SurahWidget extends StatelessWidget {
  final QuranModel quran;
  const SurahWidget({super.key, required this.quran});

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
                          "1",
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
                        quran.data?.surahs[0].englishName?? "Ashr",
                        style: Styles.textStyle16,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Meccan ",
                            style: Styles.textStyle12,
                          ),
                          Text(
                            "- 7 verses",
                            style: Styles.textStyle12,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Text(
                  "الفاتحه",
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
          )
        ],
      ),
    );
  }
}
