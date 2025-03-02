import 'package:flutter/material.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/core/widget/custom_scaffold.dart';
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
    return CustomScaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomAppBar(
            title: quran.nameTranslation!,
          ),
          SurahDetailsWidget(
            surah: quran,
          ),
          SurahContentListView(
            ayahs: quran.array!,
          ),
        ],
      ),
    );
  }
}
