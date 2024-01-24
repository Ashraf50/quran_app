import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/color/colors.dart';
import 'package:quran_app/core/utils/theme_mode.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({super.key});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.dark_mode_outlined),
              SizedBox(
                width: 24,
              ),
              Text(
                "dark Mode",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Switch(
            value: themeProvider.isDarkTheme,
            onChanged: (val) {
              themeProvider.setThemeData = val;
            },
            activeColor: secondColor,
          ),
        ],
      ),
    );
  }
}
