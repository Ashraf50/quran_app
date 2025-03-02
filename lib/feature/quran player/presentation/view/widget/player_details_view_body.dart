import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/core/widget/custom_scaffold.dart';

class PlayerDetailsViewBody extends StatefulWidget {
  final String surahName;
  final String surahNum;
  const PlayerDetailsViewBody({
    super.key,
    required this.surahName,
    required this.surahNum,
  });

  @override
  PlayerDetailsViewBodyState createState() => PlayerDetailsViewBodyState();
}

class PlayerDetailsViewBodyState extends State<PlayerDetailsViewBody> {
  late final AudioPlayer _audioPlayer;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;
  bool _isLooping = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _setupAudioListeners();
  }

  void _setupAudioListeners() {
    _audioPlayer.onDurationChanged.listen((duration) {
      if (mounted) {
        setState(() => _duration = duration);
      }
    });
    _audioPlayer.onPositionChanged.listen((position) {
      if (mounted) {
        setState(() => _position = position);
      }
    });
    _audioPlayer.onPlayerComplete.listen((_) {
      if (mounted) {
        setState(() => _isPlaying = false);
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _togglePlay() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(
        UrlSource(
            'https://server10.mp3quran.net/ajm/128/${widget.surahNum}.mp3'),
      );
    }
    setState(() => _isPlaying = !_isPlaying);
  }

  void _seekTo(Duration position) => _audioPlayer.seek(position);

  void _toggleLooping() {
    setState(() => _isLooping = !_isLooping);
    _audioPlayer.setReleaseMode(
      _isLooping ? ReleaseMode.loop : ReleaseMode.stop,
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: widget.surahName),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10),
          Image.asset('assets/img/radio_background.png'),
          _buildSlider(),
          _buildControls(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Slider(
            min: 0,
            max: _duration.inSeconds.toDouble(),
            value: _position.inSeconds.toDouble(),
            thumbColor: AppColors.primaryColor,
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.primaryOpacity,
            onChanged: (value) => _seekTo(Duration(seconds: value.toInt())),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_formatDuration(_position)),
              Text(_formatDuration(_duration)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _controlButton(Icons.replay_10,
            () => _seekTo(_position - const Duration(seconds: 10))),
        _controlButton(
          _isPlaying ? Icons.pause : Icons.play_arrow,
          _togglePlay,
          size: 48,
        ),
        _controlButton(Icons.forward_10,
            () => _seekTo(_position + const Duration(seconds: 10))),
        _controlButton(
          _isLooping ? Icons.repeat_one : Icons.loop,
          _toggleLooping,
          color: _isLooping ? Colors.red : AppColors.primaryColor,
        ),
      ],
    );
  }

  Widget _controlButton(IconData icon, VoidCallback onPressed,
      {double size = 32, Color? color}) {
    return IconButton(
      icon: Icon(icon, size: size, color: color ?? AppColors.primaryColor),
      onPressed: onPressed,
    );
  }
}
