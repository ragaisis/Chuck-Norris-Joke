import 'package:chuck_norris_joke/data/repository.dart';
import 'package:mobx/mobx.dart';

part 'categories.g.dart';

class Categories = _Categories with _$Categories;

abstract class _Categories with Store {
  late Repository _repository;

  _Categories(Repository repository) : this._repository = repository;

  static ObservableFuture<List<String>> emptyPostResponse =
      ObservableFuture.value(List.empty());

  @observable
  ObservableFuture<List<String>> fetchCategoriesFuture =
      ObservableFuture<List<String>>(emptyPostResponse);

  @observable
  List<String> categories = List.empty();

  @action
  Future getCategories() async {
    final future = _repository.getCategories();
    fetchCategoriesFuture = ObservableFuture(future);

    future.then((categoryList) {
      this.categories = categoryList;
    }).catchError((error) {
      print(error);
    });

  }
}
