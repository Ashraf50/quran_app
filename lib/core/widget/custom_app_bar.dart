import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/theme/text_style.dart';
import 'package:quran_app/core/theme/theme_mode.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor:
          themeProvider.isDarkTheme ? Color(0xff1D2233) : Color(0xFFE5E5E5),
      title: Text(
        title,
        style: themeProvider.isDarkTheme
            ? Styles.textStyle20White
            : Styles.textStyle20,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
