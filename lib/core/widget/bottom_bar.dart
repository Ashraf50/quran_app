import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/core/constant/colors.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view/azkar_view.dart';
import 'package:quran_app/feature/HadithPage/presentation/view/hadith_view.dart';
import 'package:quran_app/feature/Home/presentation/view/home_view.dart';
import 'package:quran_app/feature/menu.dart/presentation/view/mnue_view.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  changeItem(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  List pages = [
    const HomeView(),
    const HadithView(),
    const AzkarView(),
    const MenuView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(FontAwesomeIcons.bookOpenReader, size: 25, color: primaryColor),
          Icon(FontAwesomeIcons.personPraying, size: 25, color: primaryColor),
          Icon(FontAwesomeIcons.handsPraying, size: 25, color: primaryColor),
          Icon(Icons.menu, size: 25, color: primaryColor),
        ],
        height: 50,
        backgroundColor: Colors.transparent,
        color: secondColor,
        index: currentIndex,
        onTap: changeItem,
      ),
    );
  }
}
