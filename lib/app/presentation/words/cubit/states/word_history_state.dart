class WordHistoryState {
  WordHistoryState({
    this.words = const <String>[],
  });

  final List<String> words;

  WordHistoryState copyWith({
    List<String>? words,
  }) {
    return WordHistoryState(
      words: words ?? this.words,
    );
  }
}
