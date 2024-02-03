import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/quran_model/quran_model.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/details_view_body.dart';

class DetailsView extends StatelessWidget {
  final QuranModel quran;

  const DetailsView({
    super.key,
    required this.quran,
  });

  @override
  Widget build(BuildContext context) {
    return DetailsViewBody(
      quran: quran,
    );
  }
}
