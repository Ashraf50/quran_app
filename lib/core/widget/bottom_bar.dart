import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view/azkar_view.dart';
import 'package:quran_app/feature/Home/presentation/view/home_view.dart';
import 'package:quran_app/feature/menu.dart/presentation/view/menu_view.dart';
import 'package:quran_app/feature/prayer_time/presentation/view/prayer_time_view.dart';
import 'package:quran_app/feature/radio/presentation/view/radio_view.dart';

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
    const PrayerTimeView(),
    const RadioView(),
    const AzkarView(),
    const MenuView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          CustomSvg(assetName: 'quran'),
          CustomSvg(assetName: 'azan'),
          CustomSvg(assetName: 'radio'),
          CustomSvg(assetName: 'azkar'),
          CustomSvg(assetName: 'menu'),
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

class CustomSvg extends StatelessWidget {
  final String assetName;
  final double size;
  final Color? color;

  const CustomSvg({
    super.key,
    required this.assetName,
    this.size = 28,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/img/$assetName.svg",
      height: size,
      width: size,
      colorFilter: ColorFilter.mode(
        color ?? Colors.white,
        BlendMode.srcIn,
      ),
    );
  }
}
