import 'error.dart';

enum NetworkError implements Error {
  requestTimeout,
  noInternet,
  serverError,
  unknown,
}