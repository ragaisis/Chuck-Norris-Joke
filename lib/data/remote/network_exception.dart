class NetworkException implements Exception {
  String? message;
  int? statusCode;

  NetworkException({this.message, this.statusCode});
}

class ParsingException implements Exception {
  String? message;
  int? statusCode;

  ParsingException({this.message, this.statusCode});
}