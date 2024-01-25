import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/utils/theme_mode.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData? rightIcon;
  final IconData? leftIcon;
  final void Function()? leftIconOnTap;
  final void Function()? rightIconOnTap;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.rightIcon,
    required this.leftIcon,
    this.leftIconOnTap,
    required this.rightIconOnTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: leftIconOnTap,
                icon: Icon(
                  leftIcon,
                  size: 24,
                  color: const Color(0xff8789A3),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme
                      ? Colors.white
                      : const Color(0xff672CBC),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: rightIconOnTap,
            icon: Icon(
              rightIcon,
              size: 24,
              color: const Color(0xff8789A3),
            ),
          ),
        ],
      ),
    );
  }
}
