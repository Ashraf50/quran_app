import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constant/theme_mode.dart';

class AyahVerses extends StatelessWidget {
  final int ayahVerses;
  const AyahVerses({
    super.key,
    required this.ayahVerses,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        image: DecorationImage(
          scale: 1.0,
          opacity: 40,
          image: AssetImage(
            "assets/img/muslim.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          ayahVerses.toString(),
          style: TextStyle(
            fontSize: 14,
            color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
