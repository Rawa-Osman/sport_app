abstract class AppException {}

class NoInternetException implements AppException {}

class ServerException implements AppException {
  final int? statusCode;
  ServerException({this.statusCode = 500});
}

class ErrorException implements AppException {
  final Error error;
  ErrorException({required this.error});
}

class ClientSideException implements AppException {
  final String msg;
  ClientSideException({required this.msg});
}

class WebSocketException extends AppException {
  final String message;

  WebSocketException(this.message);
}
