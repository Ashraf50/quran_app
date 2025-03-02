import 'package:flutter/material.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/core/widget/custom_scaffold.dart';
import 'package:quran_app/feature/quran%20player/presentation/view/widget/player_list_view.dart';

class PlayerViewBody extends StatelessWidget {
  const PlayerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: "Radio"),
      body: ListView(
        children: [
          PlayerListView(),
        ],
      ),
    );
  }
}
