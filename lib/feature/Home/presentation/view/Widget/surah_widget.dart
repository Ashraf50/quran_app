import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/utils/text_style.dart';
import 'package:quran_app/core/utils/theme_mode.dart';

class SurahWidget extends StatelessWidget {
  const SurahWidget({super.key});

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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Al-Fatiah",
                        style: Styles.textStyle16,
                      ),
                      Row(
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
