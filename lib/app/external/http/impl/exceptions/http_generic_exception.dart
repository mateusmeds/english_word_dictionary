import 'package:english_word_dictionary/app/infra/http/export.dart'
    show HttpRequestException;

class HttpGenericException extends HttpRequestException {
  HttpGenericException({super.message, super.statusCode});
}
