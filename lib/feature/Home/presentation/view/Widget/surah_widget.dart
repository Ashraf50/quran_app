import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constant/text_style.dart';
import 'package:quran_app/core/constant/theme_mode.dart';
import 'package:quran_app/core/utils/quran_model/quran_model.dart';

class SurahWidget extends StatelessWidget {
  final QuranModel quran;
  const SurahWidget({
    super.key,
    required this.quran,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          scale: 1.0,
                          opacity: 40,
                          image: AssetImage(
                            "assets/img/muslim.png",
                          ),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        quran.id.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: themeProvider.isDarkTheme
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quran.nameTranslation!,
                        style: Styles.textStyle16,
                      ),
                      Row(
                        children: [
                          Text(
                            quran.typeEn!,
                            style: Styles.textStyle12,
                          ),
                          Text(
                            "- ${quran.array!.length} verses",
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
                  quran.name!,
                  style: Styles.textStyle20,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 3,
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
