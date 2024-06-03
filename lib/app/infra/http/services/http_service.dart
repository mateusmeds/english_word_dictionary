import 'package:english_word_dictionary/app/infra/http/export.dart'
    show HttpRequestException, HttpResponse;
import 'package:english_word_dictionary/app/shared/dependencies/export.dart'
    show AsyncResult;

abstract class HttpService {
  AsyncResult<HttpResponse, HttpRequestException> get(String path);
}
