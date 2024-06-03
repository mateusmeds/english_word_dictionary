class FavoriteWordsState {
  FavoriteWordsState({
    this.words = const <String>[],
    this.isFavorited = false,
  });

  final List<String> words;
  final bool isFavorited;

  FavoriteWordsState copyWith({
    List<String>? words,
    bool? isFavorited,
  }) {
    return FavoriteWordsState(
      words: words ?? this.words,
      isFavorited: isFavorited ?? this.isFavorited,
    );
  }
}
