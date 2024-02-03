// ignore_for_file: dead_code
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constant/colors.dart';
import 'package:quran_app/core/constant/theme_mode.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/ayah_verses.dart';
import 'package:share_plus/share_plus.dart';

class SurahContent extends StatefulWidget {
  final Widget icon;
  final Function() onPressed;
  final String surahText;
  final String path;
  final int id;
  const SurahContent({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.surahText,
    required this.path,
    required this.id,
  });

  @override
  State<SurahContent> createState() => _SurahContentState();
}

class _SurahContentState extends State<SurahContent> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: themeProvider.isDarkTheme
                  ? const Color(0xff121931)
                  : const Color(0xfff3f3f5),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: AyahVerses(ayahVerses: widget.id),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Share.share(widget.surahText);
                    },
                    icon: Icon(
                      Icons.share_outlined,
                      color: secondColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final player = AudioPlayer();
                      if (isPlaying) {
                        player.pause();
                      } else {
                        player.play(AssetSource(widget.path));
                      }
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow_outlined,
                      color: secondColor,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: widget.onPressed,
                    icon: widget.icon,
                  ),
                ],
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
              widget.surahText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Divider(
          color: themeProvider.isDarkTheme
              ? const Color.fromARGB(255, 37, 48, 86)
              : const Color(0xfff3f3f5),
        ),
        const SizedBox(
          height: 24,
        )
      ],
    );
  }
}
