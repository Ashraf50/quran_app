import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/theme_mode.dart';
import 'package:quran_app/feature/Home/data/model/surah_content_model/ayah.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/ayah_verses.dart';
import 'package:share_plus/share_plus.dart';

class SurahContent extends StatefulWidget {
  final Ayah ayah;
  final Widget icon;
  final Function() onPressed;
  const SurahContent({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.ayah,
  });

  @override
  State<SurahContent> createState() => _SurahContentState();
}

class _SurahContentState extends State<SurahContent> {
  bool isPlaying = false;
  final player = AudioPlayer();
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
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: AyahVerses(ayahVerses: widget.ayah.numberInSurah!),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Share.share(widget.ayah.text!);
                    },
                    icon: Icon(
                      Icons.share_outlined,
                      color: secondColor,
                    ),
                  ),
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
                              player.play(UrlSource(widget.ayah.audio!));
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
              widget.ayah.text!,
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
