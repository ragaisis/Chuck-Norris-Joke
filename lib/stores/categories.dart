import 'package:chuck_norris_joke/data/repository.dart';
import 'package:chuck_norris_joke/utils/exceptions.dart';
import 'package:mobx/mobx.dart';

part 'categories.g.dart';

class Categories = _Categories with _$Categories;

abstract class _Categories with Store {
  late Repository _repository;

  _Categories(Repository repository) : this._repository = repository;

  static ObservableFuture<List<String>> emptyResponse =
      ObservableFuture.value(List.empty());

  @observable
  ObservableFuture<List<String>> fetchCategoriesFuture =
      ObservableFuture<List<String>>(emptyResponse);

  //Categories are fetched from the internet. To show initial state it would be
  //nice to cache initial categories and update them when connection is available
  @observable
  List<String> categories = List.empty();

  @observable
  String error = "";

  @action
  Future getCategories() async {
    final future = _repository.getCategories();
    fetchCategoriesFuture = ObservableFuture(future);

    future.then((categoryList) {
      this.categories = categoryList;
    }).catchError((error) {
      this.error = getExceptionMessage(error);
    });
  }

}
