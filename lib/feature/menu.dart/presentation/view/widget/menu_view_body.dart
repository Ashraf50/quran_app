import 'package:flutter/material.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/feature/menu.dart/presentation/view/widget/custom_list_tile.dart';

class MenuViewBody extends StatelessWidget {
  const MenuViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomAppBar(
              title: "Settings",
              rightIcon: Icons.search,
              leftIcon: Icons.sort,
              rightIconOnTap: () {},
            ),
            const CustomListTile(),
          ],
        ),
      ),
    );
  }
}
