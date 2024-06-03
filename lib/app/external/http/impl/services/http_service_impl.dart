import 'package:english_word_dictionary/app/external/http/export.dart'
    show HttpGenericException, HttpResponseImpl;
import 'package:english_word_dictionary/app/infra/http/export.dart'
    show HttpRequestException, HttpService, HttpResponse;
import 'package:english_word_dictionary/app/shared/dependencies/export.dart'
    show AsyncResult, Dio, BaseOptions, DioException, Failure, Success;

class HttpServiceImpl implements HttpService {
  final String baseUrl;
  late final Dio _dio;

  HttpServiceImpl({required this.baseUrl}) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  @override
  AsyncResult<HttpResponse, HttpRequestException> get(String url) async {
    try {
      final response = await _dio.get(url);
      return Success(HttpResponseImpl(
        response.data,
      ));
    } on DioException catch (e) {
      return Failure(
        HttpGenericException(
          message: e.message,
          statusCode: e.response?.statusCode,
        ),
      );
    }
  }
}
