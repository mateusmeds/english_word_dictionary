import 'package:english_word_dictionary/app/domain/entities/word.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart';

abstract class WordRepository {
  AsyncResult<Word, Exception> getWord(String word, {int? id});

  AsyncResult<List<Word>, Exception> getWordsHistory();

  AsyncResult<List<Word>, Exception> getFavoriteWords();

  AsyncResult<Word, Exception> save(Word word);

  AsyncResult<Word, Exception> update(Word word);
}
