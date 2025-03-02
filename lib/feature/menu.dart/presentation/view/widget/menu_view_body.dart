import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/theme_mode.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/core/widget/custom_scaffold.dart';
import 'package:quran_app/feature/menu.dart/presentation/view/widget/custom_list_tile.dart';
import 'package:quran_app/feature/menu.dart/presentation/view/widget/dark_mode_widget.dart';

class MenuViewBody extends StatelessWidget {
  const MenuViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomScaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const CustomAppBar(
            title: "Settings",
          ),
          CustomListTile(
            title: "Add new collection",
            textColor: themeProvider.isDarkTheme ? Colors.white : secondColor,
            leftIcon: FontAwesomeIcons.folder,
            rightIcon: Icons.sort,
          ),
          CustomListTile(
            onTap: () {
              context.push('/bookmarks');
            },
            title: "Bookmarks",
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
    );
  }
}
