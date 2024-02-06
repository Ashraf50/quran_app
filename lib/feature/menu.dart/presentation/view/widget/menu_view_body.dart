import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constant/colors.dart';
import 'package:quran_app/core/constant/theme_mode.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/feature/menu.dart/presentation/view/widget/book_marks/book_marks.dart';
import 'package:quran_app/feature/menu.dart/presentation/view/widget/custom_list_tile.dart';
import 'package:quran_app/feature/menu.dart/presentation/view/widget/dark_mode_widget.dart';

class MenuViewBody extends StatelessWidget {
  const MenuViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const CustomAppBar(
              title: "Settings",
              leftIcon: Icons.sort,
            ),
            CustomListTile(
              title: "Add new collection",
              textColor: themeProvider.isDarkTheme ? Colors.white : secondColor,
              leftIcon: FontAwesomeIcons.folder,
              rightIcon: Icons.sort,
            ),
            CustomListTile(
              onTap: () {
                Get.to(() => const BookMarksListView());
              },
              title: "My Favorite",
              leftIcon: FontAwesomeIcons.folder,
              rightIcon: Icons.more_vert_outlined,
            ),
            const CustomListTile(
              title: "Daily",
              leftIcon: FontAwesomeIcons.folder,
              rightIcon: Icons.more_vert_outlined,
            ),
            const DarkModeWidget(),
          ],
        ),
      ),
    );
  }
}
