import 'package:english_word_dictionary/app/infra/http/export.dart'
    show HttpResponse;

class HttpResponseImpl implements HttpResponse {
  HttpResponseImpl(this.content);

  @override
  final dynamic content;
}
