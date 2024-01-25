import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/utils/theme_mode.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/last_read_widget.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_list_view.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomAppBar(
              leftIcon: Icons.sort,
              title: "Quran App",
              rightIcon: CupertinoIcons.search,
              rightIconOnTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                "Asslamualaikum",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff8789A3),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Tanvir Ahassan",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: themeProvider.isDarkTheme
                      ? Colors.white
                      : const Color(0xff240F4F),
                ),
              ),
            ),
            const LastReadWidget(),
            const SurahListView(),
          ],
        ),
      ),
    );
  }
}
