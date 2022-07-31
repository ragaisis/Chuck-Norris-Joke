import 'package:mobx/mobx.dart';

part 'jokeGenerator.g.dart';

class JokeGenerator = _JokeGenerator with _$JokeGenerator;

abstract class _JokeGenerator with Store {
  @observable
  bool isSearchActive = false;

  @observable
  bool isDetailsScreenVisible = false;

  @observable
  String query = "";

  @observable
  String category = "";

  @computed
  bool get isAnotherJokeButtonEnabled => query.isNotEmpty;

  @computed
  String get detailsTitle {
    if (category.isEmpty) {
      return "Random joke: \"$query\"";
    } else return "Random joke: $category";
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
    openDetailsScreen();
  }

  @action
  void searchByQuery(String query) {
    category = "";
    this.query = query;
    openDetailsScreen();
  }
}