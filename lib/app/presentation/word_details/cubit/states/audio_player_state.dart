import 'package:english_word_dictionary/app/shared/dependencies/export.dart'
    show PlayerState;

class AudioPlayerState {
  final PlayerState playerState;
  final Duration duration;
  final Duration position;

  const AudioPlayerState({
    this.playerState = PlayerState.stopped,
    this.duration = Duration.zero,
    this.position = Duration.zero,
  });

  AudioPlayerState copyWith({
    PlayerState? playerState,
    Duration? duration,
    Duration? position,
  }) {
    return AudioPlayerState(
      playerState: playerState ?? this.playerState,
      duration: duration ?? this.duration,
      position: position ?? this.position,
    );
  }
}
