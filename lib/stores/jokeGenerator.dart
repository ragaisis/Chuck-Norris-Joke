import 'package:chuck_norris_joke/data/repository.dart';
import 'package:chuck_norris_joke/models/joke.dart';
import 'package:mobx/mobx.dart';

part 'jokeGenerator.g.dart';

class JokeGenerator = _JokeGenerator with _$JokeGenerator;

abstract class _JokeGenerator with Store {
  late Repository _repository;

  _JokeGenerator(Repository repository) : this._repository = repository;

  @observable
  bool isSearchActive = false;

  @observable
  bool isDetailsScreenVisible = false;

  @observable
  String query = "";

  @observable
  String category = "";

  @observable
  Joke? joke = null;

  @observable
  ObservableFuture<Joke?> getJokeByCategoryFuture =
      ObservableFuture<Joke?>(ObservableFuture.value(null));

  @computed
  bool get isAnotherJokeButtonEnabled => query.isNotEmpty;

  @computed
  String get detailsTitle {
    if (category.isEmpty) {
      return "Random joke: \"$query\"";
    } else
      return "Random joke: $category";
  }

  @action
  void openDetailsScreen() {
    isDetailsScreenVisible = true;
  }

  @action
  void closeDetailsScreen() {
    isDetailsScreenVisible = false;
  }

  @action
  void setSearchActiveState(bool value) {
    isSearchActive = value;
  }

  @action
  void categorySelected(String value) {
    query = "";
    category = value;

    final future = _repository.getRandomJokeByCategory(value);
    getJokeByCategoryFuture = ObservableFuture(future);

    future.then((joke) {
      this.joke = joke;
      openDetailsScreen();
    }).catchError((error) {
      print(error);
    });

  }

  @action
  void searchByQuery(String query) {
    category = "";
    this.query = query;
    openDetailsScreen();
  }
}
