import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constant/theme_mode.dart';

class AzkarAppBar extends StatelessWidget {
  final String title;
  final IconData? rightIcon;
  final void Function()? rightIconOnTap;
  const AzkarAppBar({
    super.key,
    required this.title,
    required this.rightIcon,
    required this.rightIconOnTap,
  });
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: themeProvider.isDarkTheme
                  ? Colors.white
                  : const Color(0xff672CBC),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
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
    );
  }
}
