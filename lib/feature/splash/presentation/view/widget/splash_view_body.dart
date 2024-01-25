import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constant/theme_mode.dart';
import 'package:quran_app/core/widget/bottom_bar.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 86,
              ),
              Text(
                "Quran App",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme
                      ? Colors.white
                      : const Color(0xff672CBC),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                textAlign: TextAlign.center,
                "Learn Quran and\n Recite once everyday",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff8789A3),
                ),
              ),
              const SizedBox(
                height: 49,
              ),
              Stack(
                children: [
                  Image.asset(
                    "assets/img/splash.png",
                    width: 350,
                  ),
                  Positioned(
                    bottom: -2,
                    left: 110,
                    right: 110,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(const BottomBar());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xffF9B091),
                        ),
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: themeProvider.isDarkTheme
                              ? const Color(0xff091945)
                              : Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
