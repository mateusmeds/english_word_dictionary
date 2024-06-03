import 'package:english_word_dictionary/app/domain/entities/word.dart';
import 'package:english_word_dictionary/app/domain/repositories/word_repository.dart';
import 'package:english_word_dictionary/app/presentation/words/cubit/states/word_history_state.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart';

class WordHistoryCubit extends Cubit<WordHistoryState> {
  WordHistoryCubit(this._wordRepository) : super(WordHistoryState());

  final WordRepository _wordRepository;

  Future<void> getWordHistory() async {
    final response = await _wordRepository.getWordsHistory();

    response.fold(
      (success) => emit(WordHistoryState(
          words: _orderBylastTimeReaded(success).map((e) => e.word).toList())),
      (failure) => null,
    );
  }

  List<Word> _orderBylastTimeReaded(List<Word> words) {
    words.sort((a, b) => b.lastTimeReaded!.compareTo(a.lastTimeReaded!));
    return words;
  }
}
