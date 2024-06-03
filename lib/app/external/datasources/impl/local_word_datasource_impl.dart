import 'package:english_word_dictionary/app/domain/entities/definition.dart';
import 'package:english_word_dictionary/app/domain/entities/meaning.dart';
import 'package:english_word_dictionary/app/domain/entities/phonetic.dart';
import 'package:english_word_dictionary/app/domain/entities/word.dart';
import 'package:english_word_dictionary/app/infra/datasources/local_word_datasource.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart'
    show AsyncResult, Box, Failure, Hive, Success;

class LocalWordDatasourceImpl implements LocalWordDatasource {
  LocalWordDatasourceImpl() {
    _registerAdapters();
  }

  final String _nameBox = 'english_word_dictionary_tb_words';
  late Box<Word> _context;

  @override
  AsyncResult<Word, Exception> getWord(String wordText, {int? id}) async {
    try {
      await _openBox();
      final Word word = _getWord(wordText, id: id);
      return Success(word);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  @override
  AsyncResult<Word, Exception> save(Word word) async {
    try {
      await _openBox();
      await _context.add(word);
      return Success(word);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  @override
  AsyncResult<Word, Exception> update(Word word) async {
    try {
      await _openBox();
      await _context.put(word.id, word);
      return Success(word);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  @override
  AsyncResult<Word, Exception> saveAll(List<String> words) {
    // TODO: implement saveAll
    throw UnimplementedError();
  }

  Word _getWordFromStringOrThrowException(String word) {
    return _context.values.firstWhere((element) => element.word == word);
  }

  Word _getWord(String word, {int? id}) {
    if (id != null) {
      return _context.get(id)!;
    }
    return _getWordFromStringOrThrowException(word);
  }

  @override
  AsyncResult<List<Word>, Exception> getFavoriteWords() async {
    try {
      await _openBox();
      final List<Word> words = _context.values.toList();
      return Success(words.where((element) => element.isFavorited).toList());
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  @override
  AsyncResult<List<Word>, Exception> getWordsHistory() async {
    try {
      await _openBox();
      final List<Word> words = _context.values.toList();
      return Success(words);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<void> _openBox() async {
    try {
      _context = await Hive.openBox<Word>(_nameBox);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void _registerAdapters() {
    if (!Hive.isAdapterRegistered(WordAdapter().typeId)) {
      Hive.registerAdapter(WordAdapter());
      Hive.registerAdapter(MeaningAdapter());
      Hive.registerAdapter(PhoneticAdapter());
      Hive.registerAdapter(DefinitionAdapter());
    }
  }
}
