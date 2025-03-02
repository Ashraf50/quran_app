import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/theme_mode.dart';

class DarkModeWidget extends StatefulWidget {
  const DarkModeWidget({super.key});

  @override
  State<DarkModeWidget> createState() => _DarkModeWidgetState();
}

class _DarkModeWidgetState extends State<DarkModeWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.dark_mode_outlined,
                size: 27,
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                width: 18,
              ),
              const Text(
                "Dark Mode",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Switch(
            value: themeProvider.isDarkTheme,
            onChanged: (val) {
              themeProvider.setThemeData = val;
            },
            activeColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
