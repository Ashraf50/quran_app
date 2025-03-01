import 'package:flutter/material.dart';
import 'package:quran_app/feature/Home/data/model/surah_model/surah_model.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/details_view_body.dart';

class DetailsView extends StatelessWidget {
  final SurahModel surah;
  const DetailsView({
    super.key,
    required this.surah,
  });

  @override
  Widget build(BuildContext context) {
    return DetailsViewBody(
      surah: surah,
    );
  }
}
