import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/quran_model/surah.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/surah_details_widget.dart';

class DetailsViewBody extends StatelessWidget {
  final SurahModel surah;

  const DetailsViewBody({super.key, required this.surah});

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
              leftIcon: Icons.arrow_back,
              title: "Al-Fatiah",
              rightIcon: CupertinoIcons.search,
              rightIconOnTap: () {},
              leftIconOnTap: () {
                Navigator.pop(context);
              },
            ),
            SurahDetailsWidget(surah: surah),
          ],
        ),
      ),
    );
  }
}
