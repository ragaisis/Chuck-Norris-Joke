import 'package:chuck_norris_joke/data/remote/joke_api.dart';
import 'package:chuck_norris_joke/data/remote/rest_client.dart';
import 'package:chuck_norris_joke/data/repository.dart';
import 'package:chuck_norris_joke/stores/categories.dart';
import 'package:chuck_norris_joke/stores/jokeGenerator.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {

  getIt.registerSingleton(RestClient());

  getIt.registerSingleton(JokeApi(getIt<RestClient>()));

  getIt.registerSingleton(Repository(
    getIt<JokeApi>(),
  ));

  getIt.registerSingleton(Categories(getIt<Repository>()));
  getIt.registerSingleton(JokeGenerator(getIt<Repository>()));
}