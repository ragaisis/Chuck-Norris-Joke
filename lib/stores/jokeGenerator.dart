import 'dart:async';

import 'package:chuck_norris_joke/data/repository.dart';
import 'package:chuck_norris_joke/models/joke.dart';
import 'package:chuck_norris_joke/models/joke_list.dart';
import 'package:chuck_norris_joke/utils/exceptions.dart';
import 'package:mobx/mobx.dart';

part 'jokeGenerator.g.dart';

class JokeGenerator = _JokeGenerator with _$JokeGenerator;

//Currently JokeGenerator is shared in 2 screens
// But it may be better to have separate store for JokeDetails screen
abstract class _JokeGenerator with Store {
  late Repository _repository;

  _JokeGenerator(Repository repository) : this._repository = repository;

  @observable
  bool isSearchActive = false;

  //isDetailsScreenVisible could be saved in preference and
  // app could use Navigator to navigate from home page to details
  @observable
  bool isDetailsScreenVisible = false;

  @observable
  String error = "";

  @observable
  ObservableList<Joke> jokesList = ObservableList();

  @observable
  bool isLoading = false;

  @observable
  bool isAnotherJokeButtonEnabled = true;

  @observable
  ObservableFuture<JokeList> _jokesBySearchFuture = ObservableFuture<JokeList>(
      ObservableFuture.value(JokeList(jokes: List.empty())));

  @observable
  String _query = "";

  @observable
  String _category = "";

  @computed
  String get detailsTitle {
    if (_category.isEmpty) {
      return "Random joke: \"$_query\"";
    } else
      return "Random joke: $_category";
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
      _query = "";
      _category = value;
    }
    final newJoke =
        await _repository.getRandomJokeByCategory(value).catchError((error) {
      this.error = getExceptionMessage(error);
    });
    if (jokesList.isEmpty ||
        (jokesList.isNotEmpty &&
            reselected &&
            jokesList.first.id != newJoke.id)) {
      this.jokesList.clear();
      this.jokesList.addAll(JokeList(jokes: List.filled(1, newJoke)).jokes);
    } else {
      //if joke is repeated twice in a row another joke button is going to disabled state
      isAnotherJokeButtonEnabled = false;
    }
    isLoading = false;
    openDetailsScreen();
  }

  @action
  void searchByQuery(String query) {
    _category = "";
    this._query = query;

    final future = _repository.getJokesBySearch(query);
    _jokesBySearchFuture = ObservableFuture(future);

    future.then((response) {
      this.jokesList.addAll(response.jokes);
      if (jokesList.length <= 1) {
        isAnotherJokeButtonEnabled = false;
      }
      isLoading = false;
      openDetailsScreen();
    }).catchError((exception) {
      this.error = getExceptionMessage(error);
    });
  }

  @action
  void showAnotherRandomJoke() {
    if (_category.isNotEmpty) {
      categorySelected(_category, true);
    } else {
      jokesList.shuffle();
      isLoading = false;
    }
  }
}
