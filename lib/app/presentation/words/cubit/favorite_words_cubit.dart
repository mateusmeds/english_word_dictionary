import 'package:english_word_dictionary/app/domain/entities/word.dart';
import 'package:english_word_dictionary/app/domain/repositories/word_repository.dart';
import 'package:english_word_dictionary/app/presentation/words/cubit/states/favorite_words_state.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart';

class FavoriteWordsCubit extends Cubit<FavoriteWordsState> {
  FavoriteWordsCubit(this._wordRepository) : super(FavoriteWordsState());

  final WordRepository _wordRepository;

  Future<void> getFavoriteWords() async {
    final response = await _wordRepository.getFavoriteWords();

    response.fold(
      (success) =>
          emit(FavoriteWordsState(words: success.map((e) => e.word).toList())),
      (failure) => null,
    );
  }

  Future<void> favoriteWord(Word word) async {
    word.isFavorited = !word.isFavorited;
    final result = await _wordRepository.update(word);
    result.fold(
      (success) async {
        await getFavoriteWords();
        emit(state.copyWith(isFavorited: success.isFavorited));
      },
      (failure) => null,
    );
  }

  void setInitialFavoriteState(Word word) {
    emit(state.copyWith(isFavorited: word.isFavorited));
  }
}
