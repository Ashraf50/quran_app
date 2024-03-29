import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/quran_model/quran_model.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/surah_details_widget.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/surah_content_list_view.dart';

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
              quran: quran,
            ),
            SurahContentListView(
              quran: quran,
            ),
          ],
        ),
      ),
    );
  }
}
