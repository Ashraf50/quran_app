// ignore_for_file: dead_code
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constant/colors.dart';
import 'package:quran_app/core/constant/theme_mode.dart';
import 'package:quran_app/core/utils/quran_model/ayah.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/ayah_verses.dart';
import 'package:share_plus/share_plus.dart';

class SurahContent extends StatefulWidget {
  final Widget icon;
  final Function() onPressed;
  final Ayah ayah;
  const SurahContent({
    super.key,
    required this.ayah,
    required this.icon,
    required this.onPressed,
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
                child: AyahVerses(ayahVerses: widget.ayah.numberInSurah),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Share.share(widget.ayah.text);
                    },
                    icon: Icon(
                      Icons.share_outlined,
                      color: secondColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final player = AudioPlayer();
                      if (isPlaying) {
                        player.pause();
                      } else {
                        await player.play(UrlSource(widget.ayah.audio));
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
              widget.ayah.text,
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
