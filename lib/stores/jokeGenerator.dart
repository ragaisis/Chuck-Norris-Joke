import 'dart:async';

import 'package:chuck_norris_joke/data/repository.dart';
import 'package:chuck_norris_joke/models/joke.dart';
import 'package:chuck_norris_joke/models/joke_list.dart';
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
  String error = "";

  @observable
  ObservableList<Joke> jokesList = ObservableList();

  @observable
  bool isLoading = false;

  @observable
  bool isAnotherJokeButtonEnabled = true;

  @observable
  ObservableFuture<JokeList> getJokesBySearchFuture =
      ObservableFuture<JokeList>(
          ObservableFuture.value(JokeList(jokes: List.empty())));

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
    isAnotherJokeButtonEnabled = true;
    isLoading = false;
    jokesList.clear();
  }

  @action
  void setSearchActiveState(bool value) {
    isSearchActive = value;
  }

  @action
  Future<void> categorySelected(String value, bool reselected) async {
    if (!reselected) {
      query = "";
      category = value;
    }
    final newJoke = await _repository.getRandomJokeByCategory(value);
    if (jokesList.isEmpty ||
        (jokesList.isNotEmpty &&
            reselected &&
            jokesList.first.id != newJoke.id)) {
      this.jokesList.clear();
      this.jokesList.addAll(JokeList(jokes: List.filled(1, newJoke)).jokes);
    } else {
      isAnotherJokeButtonEnabled = false;
    }
    isLoading = false;
    openDetailsScreen();
  }

  @action
  void searchByQuery(String query) {
    category = "";
    this.query = query;

    final future = _repository.getJokesBySearch(query);
    getJokesBySearchFuture = ObservableFuture(future);

    future.then((response) {
      this.jokesList.addAll(response.jokes);
      if (jokesList.length <= 1) {
        isAnotherJokeButtonEnabled = false;
      }
      isLoading = false;
      openDetailsScreen();
    }).catchError((exception) {
      this.error = "No items found based on search: $query";
      print(exception);
    });
  }

  @action
  void showAnotherRandomJoke() {
    if (category.isNotEmpty) {
      categorySelected(category, true);
    } else {
      jokesList.shuffle();
      isLoading = false;
    }
  }
}
