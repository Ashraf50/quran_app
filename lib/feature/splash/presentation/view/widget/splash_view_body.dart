import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/widget/custom_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quran_app/core/theme/theme_mode.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  SplashViewBodyState createState() => SplashViewBodyState();
}

class SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    bool hasSeenSplash = prefs.getBool('hasSeenSplash') ?? false;
    if (hasSeenSplash) {
      context.go('/bottom_bar');
    }
  }

  Future<void> _completeSplashScreen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenSplash', true);
    context.go('/bottom_bar');
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomScaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 86),
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
            const SizedBox(height: 16),
            const Text(
              textAlign: TextAlign.center,
              "Learn Quran and\n Recite once everyday",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff8789A3),
              ),
            ),
            const SizedBox(height: 49),
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
                    onPressed: _completeSplashScreen,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
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
    );
  }
}
