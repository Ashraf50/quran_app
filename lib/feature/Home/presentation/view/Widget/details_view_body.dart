import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/feature/Home/data/model/quran_model/quran_model.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_content_list_view.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_details_widget.dart';

class DetailsViewBody extends StatelessWidget {
  final QuranModel quran;
  const DetailsViewBody({
    super.key,
    required this.quran,
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
              title: quran.nameTranslation!,
              rightIcon: CupertinoIcons.search,
              rightIconOnTap: () {},
              leftIconOnTap: () {
                Navigator.pop(context);
              },
            ),
            SurahDetailsWidget(
              surah: quran,
            ),
            SurahContentListView(ayahs: quran.array!,),
          ],
        ),
      ),
    );
  }
}
