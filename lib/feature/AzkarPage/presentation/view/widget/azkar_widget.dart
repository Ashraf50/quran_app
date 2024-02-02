import 'package:audioplayers/audioplayers.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/constant/colors.dart';
import 'package:quran_app/core/widget/show_snack_bar.dart';
import 'package:share_plus/share_plus.dart';

class AzkarWidget extends StatelessWidget {
  final String text;
  final String audio;
  const AzkarWidget({
    super.key,
    required this.text,
    required this.audio,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(31, 18, 25, 49),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    var player = AudioPlayer();
                    player.play(AssetSource(audio));
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    color: secondColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Share.share(text);
                  },
                  icon: Icon(
                    Icons.share,
                    color: secondColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    FlutterClipboard.copy(text).then(
                      (value) => showSnackBar(context, "copied", Icons.copy),
                    );
                  },
                  icon: Icon(
                    Icons.copy_outlined,
                    color: secondColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_border,
                    color: secondColor,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
