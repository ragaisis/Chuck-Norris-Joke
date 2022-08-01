import 'dart:convert';
import 'package:chuck_norris_joke/data/remote/endpoints.dart';
import 'package:chuck_norris_joke/data/remote/network_exception.dart';
import 'package:http/http.dart' as http;

class RestClient {
  final JsonDecoder _decoder = JsonDecoder();

  Future<dynamic> get(String path, Map<String, String> queryParams) {
    if (queryParams.isEmpty)
      return http.get(Uri.https(Endpoints.baseUrl, path)).then(_createResponse);
    else
      return http.get(Uri.https(Endpoints.baseUrl, path, queryParams)).then(_createResponse);
  }

  getCategories() {}

  dynamic _createResponse(http.Response response) {
    final String res = response.body;
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400) {
      throw NetworkException(
          message: 'Error fetching data from server', statusCode: statusCode);
    }

    return _decoder.convert(res);
  }
}
