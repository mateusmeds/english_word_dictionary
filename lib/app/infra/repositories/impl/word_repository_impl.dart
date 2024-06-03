import 'package:english_word_dictionary/app/domain/entities/word.dart';
import 'package:english_word_dictionary/app/domain/repositories/word_repository.dart';
import 'package:english_word_dictionary/app/infra/datasources/local_word_datasource.dart';
import 'package:english_word_dictionary/app/infra/datasources/word_datasource.dart';
import 'package:english_word_dictionary/app/infra/mappers/word_mapper.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart'
    show AsyncResult, Failure, Success;

class WordRepositoryImpl implements WordRepository {
  WordRepositoryImpl(
    this._externalWordDatasource,
    this._localWordDatasource,
  );

  final WordDatasource _externalWordDatasource;
  final LocalWordDatasource _localWordDatasource;

  @override
  AsyncResult<Word, Exception> getWord(String word, {int? id}) async {
    final localWordResult = await _localWordDatasource.getWord(word, id: id);
    if (localWordResult is Success) {
      return localWordResult;
    }

    final externalWordResult = await _externalWordDatasource.getWord(word);
    return externalWordResult.fold(
      (success) {
        final Word word = WordMapper.fromDTO(success);
        _localWordDatasource.save(word);
        return Success(word);
      },
      (failure) => Failure(failure),
    );
  }

  @override
  AsyncResult<Word, Exception> save(Word word) async {
    return _localWordDatasource.save(word);
  }

  @override
  AsyncResult<Word, Exception> update(Word word) async {
    return _localWordDatasource.update(word);
  }

  @override
  AsyncResult<List<Word>, Exception> getFavoriteWords() async {
    return await _localWordDatasource.getFavoriteWords();
  }

  @override
  AsyncResult<List<Word>, Exception> getWordsHistory() async {
    return await _localWordDatasource.getWordsHistory();
  }
}
