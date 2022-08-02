import 'dart:async';

import 'package:chuck_norris_joke/data/remote/joke_api.dart';
import 'package:chuck_norris_joke/models/joke.dart';
import 'package:chuck_norris_joke/models/joke_list.dart';

//Repository handles only API calls, but cache & database could be added here
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

  Future<JokeList> getJokesBySearch(String query) async {
    return await _jokeApi
        .getJokesBySearch(query)
        .catchError((error) => throw error);
  }
}
