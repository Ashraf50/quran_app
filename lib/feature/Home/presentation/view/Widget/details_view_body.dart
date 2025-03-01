import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/feature/Home/data/model/surah_model/surah_model.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_details_widget.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_content_list_view.dart';

class DetailsViewBody extends StatelessWidget {
  final SurahModel surah;
  const DetailsViewBody({
    super.key,
    required this.surah,
  });

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
              title: surah.englishName!,
              rightIcon: CupertinoIcons.search,
              rightIconOnTap: () {},
              leftIconOnTap: () {
                Navigator.pop(context);
              },
            ),
            SurahDetailsWidget(
              surah: surah,
            ),
            SurahContentListView(
              surahNum: surah.number!,
            ),
          ],
        ),
      ),
    );
  }
}
