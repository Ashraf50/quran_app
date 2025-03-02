import 'package:flutter/material.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/core/widget/custom_scaffold.dart';
import 'package:quran_app/feature/radio/presentation/view/widget/radio_list_view.dart';

class RadioViewBody extends StatelessWidget {
  const RadioViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: "Radio"),
      body: ListView(
        children: [
          RadioListView(),
        ],
      ),
    );
  }
}
