import 'package:english_word_dictionary/app/infra/dtos/word_dto.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart';

abstract class WordDatasource {
  AsyncResult<WordDTO, Exception> getWord(String word);
}
