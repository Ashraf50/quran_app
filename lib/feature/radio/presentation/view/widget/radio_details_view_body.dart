import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/core/widget/custom_scaffold.dart';
import 'package:quran_app/feature/radio/data/model/radio_model.dart';

class RadioDetailsViewBody extends StatefulWidget {
  final RadioModel radio;
  const RadioDetailsViewBody({super.key, required this.radio});

  @override
  RadioDetailsViewBodyState createState() => RadioDetailsViewBodyState();
}

class RadioDetailsViewBodyState extends State<RadioDetailsViewBody> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  Future<void> _togglePlay() async {
    if (isPlaying) {
      await _audioPlayer.stop();
    } else {
      await _audioPlayer.play(UrlSource(widget.radio.url!));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: widget.radio.title!),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/img/radio_background.svg'),
          const SizedBox(height: 20),
          IconButton(
            iconSize: 80,
            icon: Icon(
              isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
              color: Colors.blue,
            ),
            onPressed: _togglePlay,
          ),
          const SizedBox(height: 10),
          Text(
            isPlaying ? "playing" : "click playing",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
