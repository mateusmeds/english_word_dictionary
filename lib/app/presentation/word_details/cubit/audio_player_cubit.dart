import 'package:english_word_dictionary/app/presentation/word_details/cubit/states/audio_player_state.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart'
    show AudioPlayer, Cubit, PlayerState, ReleaseMode;

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  late final AudioPlayer _player;

  AudioPlayerCubit() : super(const AudioPlayerState()) {
    _player = AudioPlayer();
    _initStreams();
  }

  void _initStreams() {
    _player.setReleaseMode(ReleaseMode.stop);

    _player.getCurrentPosition().then((position) {
      emit(state.copyWith(position: position));
    });

    _player.getDuration().then((duration) {
      emit(state.copyWith(duration: duration));
    });

    _player.onDurationChanged.listen((duration) {
      emit(state.copyWith(duration: duration));
    });

    _player.onPositionChanged.listen((position) {
      emit(state.copyWith(position: position));
    });

    _player.onPlayerStateChanged.listen((playerState) {
      emit(state.copyWith(playerState: playerState));
    });

    _player.onPlayerComplete.listen((_) {
      emit(state.copyWith(
        playerState: PlayerState.stopped,
        position: Duration.zero,
      ));
    });
  }

  Future<void> setSource(String url) async {
    await _player.setSourceUrl(url);
  }

  Future<void> play() async {
    await _player.resume();
    emit(state.copyWith(playerState: PlayerState.playing));
  }

  Future<void> pause() async {
    await _player.pause();
    emit(state.copyWith(playerState: PlayerState.paused));
  }

  Future<void> moveCursorPosition(Duration position) async {
    await _player.seek(position);
  }

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }
}
