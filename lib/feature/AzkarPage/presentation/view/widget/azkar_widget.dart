import 'package:audioplayers/audioplayers.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constant/colors.dart';
import 'package:quran_app/core/constant/theme_mode.dart';
import 'package:quran_app/core/widget/show_snack_bar.dart';
import 'package:share_plus/share_plus.dart';

class AzkarWidget extends StatefulWidget {
  final String text;
  final String audio;
  const AzkarWidget({
    super.key,
    required this.text,
    required this.audio,
  });

  @override
  State<AzkarWidget> createState() => _AzkarWidgetState();
}

class _AzkarWidgetState extends State<AzkarWidget> {
  bool isPlaying = false;
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: themeProvider.isDarkTheme
                  ? const Color(0xff121931)
                  : const Color(0xfff3f3f5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isPlaying
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            player.stop();
                            isPlaying = false;
                          });
                        },
                        icon: Icon(
                          Icons.pause,
                          color: secondColor,
                          size: 30,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            player.play(AssetSource(widget.audio));
                            isPlaying = true;
                          });
                        },
                        icon: Icon(
                          Icons.play_arrow_outlined,
                          color: secondColor,
                          size: 30,
                        ),
                      ),
                IconButton(
                  onPressed: () {
                    Share.share(widget.text);
                  },
                  icon: Icon(
                    Icons.share,
                    color: secondColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    FlutterClipboard.copy(widget.text).then(
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
                widget.text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
