import 'package:chuck_norris_joke/models/joke.dart';

class JokeList {
  final List<Joke> jokes;

  JokeList({
    required this.jokes,
  });

  factory JokeList.fromJson(List<dynamic> json) {
    List<Joke> jokes = <Joke>[];
    jokes = json.map((post) => Joke.fromMap(post)).toList();

    return JokeList(
      jokes: jokes,
    );
  }

}