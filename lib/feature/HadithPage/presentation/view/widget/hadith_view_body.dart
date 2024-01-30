import 'package:flutter/material.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/feature/HadithPage/presentation/view/widget/hadith_list_view.dart';
import 'package:quran_app/feature/HadithPage/presentation/view/widget/hadith_widget.dart';

class HadithViewBody extends StatelessWidget {
  const HadithViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomAppBar(
            title: "Hadiths",
            rightIcon: Icons.search,
            leftIcon: Icons.sort,
            rightIconOnTap: () {},
          ),
          const HadithListView()
        ],
      ),
    ));
  }
}
