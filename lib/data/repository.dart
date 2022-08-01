import 'dart:async';

import 'package:chuck_norris_joke/data/remote/joke_api.dart';
import 'package:chuck_norris_joke/models/joke.dart';

class Repository {
  final JokeApi _jokeApi;

  Repository(this._jokeApi);

  Future<List<String>> getCategories() async {
    return await _jokeApi.getCategories().catchError((error) => throw error);
  }

  Future<Joke> getRandomJokeByCategory(String category) async {
    return await _jokeApi
        .getRandomJokeByCategory(category)
        .catchError((error) => throw error);
  }
}
