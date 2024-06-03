import 'package:english_word_dictionary/app/domain/entities/word.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart';

abstract class LocalWordDatasource {
  AsyncResult<Word, Exception> getWord(String wordText, {int? id});

  AsyncResult<Word, Exception> saveAll(List<String> words);

  AsyncResult<Word, Exception> save(Word word);

  AsyncResult<Word, Exception> update(Word word);

  AsyncResult<List<Word>, Exception> getWordsHistory();

  AsyncResult<List<Word>, Exception> getFavoriteWords();
}
