import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constant/theme_mode.dart';

class AyahVerses extends StatelessWidget {
  final int ayahVerses;
  const AyahVerses({super.key, required this.ayahVerses});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Stack(
      children: [
        SvgPicture.asset("assets/img/muslim.svg"),
        Positioned(
          left: 14,
          top: 8,
          child: Text(
            textAlign: TextAlign.center,
            ayahVerses.toString(),
            style: TextStyle(
              fontSize: 14,
              color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
