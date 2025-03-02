import 'package:flutter/material.dart';
import 'package:quran_app/feature/Home/data/model/quran_model/quran_model.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/details_view_body.dart';

class DetailsView extends StatelessWidget {
  final QuranModel surah;
  const DetailsView({
    super.key,
    required this.surah,
  });

  @override
  Widget build(BuildContext context) {
    return DetailsViewBody(
      quran: surah,
    );
  }
}
