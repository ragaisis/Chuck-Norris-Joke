import 'package:chuck_norris_joke/data/remote/endpoints.dart';
import 'package:chuck_norris_joke/data/remote/network_exception.dart';
import 'package:chuck_norris_joke/data/remote/rest_client.dart';
import 'package:chuck_norris_joke/models/joke.dart';

class JokeApi {
  final RestClient _restClient;

  JokeApi(this._restClient);

  Future<List<String>> getCategories() async {
    return _restClient
        .get(Endpoints.getCategories, Map<String, String>())
        .then((dynamic response) {
      print("http getCategories response: $response");
      return List<String>.from(response);
    }).catchError((error) => throw NetworkException(message: error));
  }

  Future<Joke> getRandomJokeByCategory(String category) async {
    Map<String, String> queryParams = {'category': category};
    return _restClient
        .get(Endpoints.getRandomJoke, queryParams)
        .then((dynamic response) {
      print("http getRandomJokeByCategory response: $response");
      return Joke.fromMap(response);
    }).catchError((error) => throw NetworkException(message: error));
  }
}