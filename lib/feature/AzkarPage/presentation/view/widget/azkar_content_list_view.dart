import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/adhkar_model/adhkar_model.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view/widget/azkar_widget.dart';

class AzkarContentListView extends StatelessWidget {
  final AdhkarModel azkar;
  const AzkarContentListView({super.key, required this.azkar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: azkar.array!.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return AzkarWidget(
              text: azkar.array![index].text!,
              audio: azkar.array![index].audio!,
            );
          }),
    );
  }
}
