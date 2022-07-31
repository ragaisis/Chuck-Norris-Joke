// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jokeGenerator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$JokeGenerator on _JokeGenerator, Store {
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

  late final _$queryAtom = Atom(name: '_JokeGenerator.query', context: context);

  @override
  String get query {
    _$queryAtom.reportRead();
    return super.query;
  }

  @override
  set query(String value) {
    _$queryAtom.reportWrite(value, super.query, () {
      super.query = value;
    });
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
  String toString() {
    return '''
isSearchActive: ${isSearchActive},
isDetailsScreenVisible: ${isDetailsScreenVisible},
query: ${query}
    ''';
  }
}
