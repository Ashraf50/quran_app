import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/quran_model/surah_model.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/details_view_body.dart';

class DetailsView extends StatelessWidget {
  final SurahModel surah;
  final int surahNumber;

  const DetailsView(
      {super.key, required this.surah, required this.surahNumber});

  @override
  Widget build(BuildContext context) {
    return DetailsViewBody(
      surah: surah,
      surahNumber: surahNumber,
    );
  }
}
