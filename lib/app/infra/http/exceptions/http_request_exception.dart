abstract class HttpRequestException implements Exception {
  HttpRequestException({
    this.message,
    this.statusCode,
  });
  final String? message;
  final int? statusCode;
}
