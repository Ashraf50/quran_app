import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/adhkar_model/adhkar_model.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view/widget/azkar_app_bar.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view/widget/azkar_content_list_view.dart';

class AzkarContentView extends StatelessWidget {
  final AdhkarModel azkar;
  const AzkarContentView({
    super.key,
    required this.azkar,
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
          AzkarAppBar(
            title: azkar.category!,
            rightIcon: Icons.arrow_forward,
            rightIconOnTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          AzkarContentListView(azkar: azkar),
        ],
      ),
    ));
  }
}
