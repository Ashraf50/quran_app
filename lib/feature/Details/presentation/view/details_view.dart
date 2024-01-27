import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/quran_model/surah.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/details_view_body.dart';

class DetailsView extends StatelessWidget {
  final SurahModel surah;

  const DetailsView({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return DetailsViewBody(
      surah: surah,
    );
  }
}
