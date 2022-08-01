// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Categories on _Categories, Store {
  late final _$fetchCategoriesFutureAtom =
      Atom(name: '_Categories.fetchCategoriesFuture', context: context);

  @override
  ObservableFuture<List<String>> get fetchCategoriesFuture {
    _$fetchCategoriesFutureAtom.reportRead();
    return super.fetchCategoriesFuture;
  }

  @override
  set fetchCategoriesFuture(ObservableFuture<List<String>> value) {
    _$fetchCategoriesFutureAtom.reportWrite(value, super.fetchCategoriesFuture,
        () {
      super.fetchCategoriesFuture = value;
    });
  }

  late final _$categoriesAtom =
      Atom(name: '_Categories.categories', context: context);

  @override
  List<String> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<String> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$getCategoriesAsyncAction =
      AsyncAction('_Categories.getCategories', context: context);

  @override
  Future<dynamic> getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  @override
  String toString() {
    return '''
fetchCategoriesFuture: ${fetchCategoriesFuture},
categories: ${categories}
    ''';
  }
}
