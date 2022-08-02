// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jokeGenerator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$JokeGenerator on _JokeGenerator, Store {
  Computed<String>? _$detailsTitleComputed;

  @override
  String get detailsTitle =>
      (_$detailsTitleComputed ??= Computed<String>(() => super.detailsTitle,
              name: '_JokeGenerator.detailsTitle'))
          .value;

  late final _$isSearchActiveAtom =
      Atom(name: '_JokeGenerator.isSearchActive', context: context);

  @override
  bool get isSearchActive {
    _$isSearchActiveAtom.reportRead();
    return super.isSearchActive;
  }

  @override
  set isSearchActive(bool value) {
    _$isSearchActiveAtom.reportWrite(value, super.isSearchActive, () {
      super.isSearchActive = value;
    });
  }

  late final _$isDetailsScreenVisibleAtom =
      Atom(name: '_JokeGenerator.isDetailsScreenVisible', context: context);

  @override
  bool get isDetailsScreenVisible {
    _$isDetailsScreenVisibleAtom.reportRead();
    return super.isDetailsScreenVisible;
  }

  @override
  set isDetailsScreenVisible(bool value) {
    _$isDetailsScreenVisibleAtom
        .reportWrite(value, super.isDetailsScreenVisible, () {
      super.isDetailsScreenVisible = value;
    });
  }

  late final _$errorAtom = Atom(name: '_JokeGenerator.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$jokesListAtom =
      Atom(name: '_JokeGenerator.jokesList', context: context);

  @override
  ObservableList<Joke> get jokesList {
    _$jokesListAtom.reportRead();
    return super.jokesList;
  }

  @override
  set jokesList(ObservableList<Joke> value) {
    _$jokesListAtom.reportWrite(value, super.jokesList, () {
      super.jokesList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_JokeGenerator.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isAnotherJokeButtonEnabledAtom =
      Atom(name: '_JokeGenerator.isAnotherJokeButtonEnabled', context: context);

  @override
  bool get isAnotherJokeButtonEnabled {
    _$isAnotherJokeButtonEnabledAtom.reportRead();
    return super.isAnotherJokeButtonEnabled;
  }

  @override
  set isAnotherJokeButtonEnabled(bool value) {
    _$isAnotherJokeButtonEnabledAtom
        .reportWrite(value, super.isAnotherJokeButtonEnabled, () {
      super.isAnotherJokeButtonEnabled = value;
    });
  }

  late final _$_jokesBySearchFutureAtom =
      Atom(name: '_JokeGenerator._jokesBySearchFuture', context: context);

  @override
  ObservableFuture<JokeList> get _jokesBySearchFuture {
    _$_jokesBySearchFutureAtom.reportRead();
    return super._jokesBySearchFuture;
  }

  @override
  set _jokesBySearchFuture(ObservableFuture<JokeList> value) {
    _$_jokesBySearchFutureAtom.reportWrite(value, super._jokesBySearchFuture,
        () {
      super._jokesBySearchFuture = value;
    });
  }

  late final _$_queryAtom =
      Atom(name: '_JokeGenerator._query', context: context);

  @override
  String get _query {
    _$_queryAtom.reportRead();
    return super._query;
  }

  @override
  set _query(String value) {
    _$_queryAtom.reportWrite(value, super._query, () {
      super._query = value;
    });
  }

  late final _$_categoryAtom =
      Atom(name: '_JokeGenerator._category', context: context);

  @override
  String get _category {
    _$_categoryAtom.reportRead();
    return super._category;
  }

  @override
  set _category(String value) {
    _$_categoryAtom.reportWrite(value, super._category, () {
      super._category = value;
    });
  }

  late final _$categorySelectedAsyncAction =
      AsyncAction('_JokeGenerator.categorySelected', context: context);

  @override
  Future<void> categorySelected(String value, bool reselected) {
    return _$categorySelectedAsyncAction
        .run(() => super.categorySelected(value, reselected));
  }

  late final _$_JokeGeneratorActionController =
      ActionController(name: '_JokeGenerator', context: context);

  @override
  void openDetailsScreen() {
    final _$actionInfo = _$_JokeGeneratorActionController.startAction(
        name: '_JokeGenerator.openDetailsScreen');
    try {
      return super.openDetailsScreen();
    } finally {
      _$_JokeGeneratorActionController.endAction(_$actionInfo);
    }
  }

  @override
  void closeDetailsScreen() {
    final _$actionInfo = _$_JokeGeneratorActionController.startAction(
        name: '_JokeGenerator.closeDetailsScreen');
    try {
      return super.closeDetailsScreen();
    } finally {
      _$_JokeGeneratorActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchActiveState(bool value) {
    final _$actionInfo = _$_JokeGeneratorActionController.startAction(
        name: '_JokeGenerator.setSearchActiveState');
    try {
      return super.setSearchActiveState(value);
    } finally {
      _$_JokeGeneratorActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchByQuery(String query) {
    final _$actionInfo = _$_JokeGeneratorActionController.startAction(
        name: '_JokeGenerator.searchByQuery');
    try {
      return super.searchByQuery(query);
    } finally {
      _$_JokeGeneratorActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showAnotherRandomJoke() {
    final _$actionInfo = _$_JokeGeneratorActionController.startAction(
        name: '_JokeGenerator.showAnotherRandomJoke');
    try {
      return super.showAnotherRandomJoke();
    } finally {
      _$_JokeGeneratorActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSearchActive: ${isSearchActive},
isDetailsScreenVisible: ${isDetailsScreenVisible},
error: ${error},
jokesList: ${jokesList},
isLoading: ${isLoading},
isAnotherJokeButtonEnabled: ${isAnotherJokeButtonEnabled},
detailsTitle: ${detailsTitle}
    ''';
  }
}
