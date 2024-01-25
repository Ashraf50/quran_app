import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/feature/Details/presentation/view/details_view.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_widget.dart';

class SurahListView extends StatelessWidget {
  const SurahListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 114,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Get.to(const DetailsView());
          },
          child: const SurahWidget(),
        );
      },
    );
  }
}
