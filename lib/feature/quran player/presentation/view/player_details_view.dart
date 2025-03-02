import 'package:flutter/material.dart';
import 'widget/player_details_view_body.dart';

class PlayerDetailsView extends StatelessWidget {
  final String surahNum;
  final String surahName;
  const PlayerDetailsView({
    super.key,
    required this.surahNum,
    required this.surahName,
  });

  @override
  Widget build(BuildContext context) {
    return PlayerDetailsViewBody(
      surahName: surahName,
      surahNum: surahNum,
    );
  }
}
