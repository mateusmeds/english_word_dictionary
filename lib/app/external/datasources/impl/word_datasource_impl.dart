import 'package:english_word_dictionary/app/infra/datasources/word_datasource.dart';
import 'package:english_word_dictionary/app/infra/dtos/word_dto.dart';
import 'package:english_word_dictionary/app/infra/http/export.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart';

class WordDatasourceImpl implements WordDatasource {
  WordDatasourceImpl(this.httpService);
  final HttpService httpService;

  @override
  AsyncResult<WordDTO, Exception> getWord(String word) async {
    final response = await httpService.get('/$word');
    return response.fold(
      (success) => Success(WordDTO.fromJson(success.content)),
      (failure) => Failure(failure),
    );
  }
}
