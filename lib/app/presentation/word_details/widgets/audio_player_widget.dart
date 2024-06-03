import 'package:english_word_dictionary/app/presentation/word_details/cubit/audio_player_cubit.dart';
import 'package:english_word_dictionary/app/presentation/word_details/cubit/states/audio_player_state.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart'
    show BlocBuilder, PlayerState;
import 'package:flutter/material.dart';

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({super.key, required this.playerUrl});

  final String playerUrl;

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayerCubit _audioPlayerCubit;

  @override
  void initState() {
    _audioPlayerCubit = AudioPlayerCubit();
    _audioPlayerCubit.setSource(widget.playerUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
      bloc: _audioPlayerCubit,
      builder: (context, state) {
        final isPlaying = state.playerState == PlayerState.playing;
        final position = state.position.inMilliseconds;
        final duration = state.duration.inMilliseconds;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    if (isPlaying) {
                      _audioPlayerCubit.pause();
                    } else {
                      _audioPlayerCubit.play();
                    }
                  },
                  iconSize: 48.0,
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  color: Theme.of(context).primaryColor,
                ),
                Expanded(
                  child: Slider(
                    onChanged: (value) {
                      final position = value * duration;
                      _audioPlayerCubit.moveCursorPosition(
                          Duration(milliseconds: position.round()));
                    },
                    value: (position > 0 && position < duration)
                        ? position / duration
                        : 0.0,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void Function()? _iconButtonOnPressed(bool isPlaying) {
    return () {
      if (isPlaying) {
        _audioPlayerCubit.pause();
      } else {
        _audioPlayerCubit.play();
      }
    };
  }

  void Function()? _sliderOnChanged(double value) {
    return () {
      final duration = _audioPlayerCubit.state.duration;
      final position = value * duration.inMilliseconds;
      _audioPlayerCubit
          .moveCursorPosition(Duration(milliseconds: position.round()));
    };
  }

  double _calculateSliderValue(int position, int duration) {
    return (position > 0 && position < duration) ? position / duration : 0.0;
  }
}
