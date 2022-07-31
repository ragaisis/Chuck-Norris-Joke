import 'package:mobx/mobx.dart';

part 'categories.g.dart';

class Categories = _Categories with _$Categories;

abstract class _Categories with Store {
  @observable
  ObservableList<String> categories = ObservableList<String>();

  @action
  void getCategories() {
    // https://api.chucknorris.io/jokes/categories
    if (categories.isEmpty) {
      categories.add("animal");
      categories.add("career");
      categories.add("celebrity");
      categories.add("dev");
      categories.add("explicit");
      categories.add("fashion");
      categories.add("food");
      categories.add("history");
      categories.add("money");
      categories.add("movie");
      categories.add("music");
      categories.add("political");
      categories.add("religion");
      categories.add("science");
      categories.add("sport");
      categories.add("travel");
    }
  }
}
