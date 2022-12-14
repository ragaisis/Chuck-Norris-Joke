import 'dart:async';

import 'package:chuck_norris_joke/data/repository.dart';
import 'package:chuck_norris_joke/di/service_locator.dart';
import 'package:chuck_norris_joke/stores/categories.dart';
import 'package:chuck_norris_joke/ui/joke_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../stores/jokeGenerator.dart';
import '../widgets/search_field_widget.dart';

final jokeGeneratorStore = JokeGenerator(getIt<Repository>());
final categoriesStore = Categories(getIt<Repository>());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck Norris',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Categories>(create: (_) => categoriesStore),
        Provider<JokeGenerator>(create: (_) => jokeGeneratorStore),
      ],
      child: ReactionBuilder(
          builder: (context) {
            return _buildErrorHandlingReaction(context);
          },
          child: ReactionBuilder(
              builder: (context) {
                return _buildCategoriesErrorHandlingReaction(context);
              },
              child: Stack(children: [
                Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: Colors.white,
                  appBar: _buildAppBar(),
                  body: _buildScrollableContent(),
                ),
                Observer(
                    builder: (_) => Visibility(
                        child: JokeDetailsScreen(
                          title: jokeGeneratorStore.detailsTitle,
                          joke: jokeGeneratorStore.jokesList.isNotEmpty
                              ? jokeGeneratorStore.jokesList.elementAt(0).title
                              : '',
                          isDetailsScreenVisible:
                              jokeGeneratorStore.isDetailsScreenVisible,
                          isNextJokeButtonEnabled:
                              jokeGeneratorStore.isAnotherJokeButtonEnabled,
                          onBackPressed: () {
                            jokeGeneratorStore.closeDetailsScreen();
                          },
                          onNextJokePressed: () {
                            jokeGeneratorStore.showAnotherRandomJoke();
                          },
                        ),
                        visible: jokeGeneratorStore.isDetailsScreenVisible))
              ]))),
    );
  }



  ReactionDisposer _buildCategoriesErrorHandlingReaction(BuildContext context) {
    return reaction((_) => categoriesStore.error, (errorMessage) {
      _handleErrorInUi(errorMessage, context);
    });
  }

  ReactionDisposer _buildErrorHandlingReaction(BuildContext context) {
    return reaction((_) => jokeGeneratorStore.error, (errorMessage) {
      _handleErrorInUi(errorMessage, context);
    });
  }

  void _handleErrorInUi(Object? errorMessage, BuildContext context) {
    if (errorMessage.toString().isNotEmpty) {
      var snackbarDurationInSeconds = 3;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage.toString()),
          duration: Duration(seconds: snackbarDurationInSeconds)));
      Timer(Duration(seconds: snackbarDurationInSeconds), () {
        jokeGeneratorStore.error = "";
      });
    }
  }

  SingleChildScrollView _buildScrollableContent() {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin:
              const EdgeInsets.only(left: 38, top: 2, right: 38, bottom: 24),
          child: Observer(
            builder: (_) => _buildSearchFieldWidget(),
          ),
        ),
        Observer(
          builder: (_) => Text(jokeGeneratorStore.isSearchActive
              ? 'Search for a random joke'
              : 'Or choose a category'),
        ),
        Observer(
            builder: (_) => Visibility(
                child: CategoriesGrid(),
                visible: jokeGeneratorStore.isSearchActive == false))
      ],
    ));
  }

  SearchFieldWidget _buildSearchFieldWidget() {
    return SearchFieldWidget(
      hintText:
          jokeGeneratorStore.isSearchActive ? '' : 'Search for a random joke',
      onClearPressed: () async {
        jokeGeneratorStore.setSearchActiveState(false);
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      onFocusChanged: (hasFocus) async {
        jokeGeneratorStore.setSearchActiveState(hasFocus);
      },
      onQuerySubmitted: (query) async {
        jokeGeneratorStore.searchByQuery(query);
      },
    );
  }

  AppBar _buildAppBar() => AppBar(
      title: Text('CHUCK NORRIS'),
      elevation: 0,
      toolbarHeight: 72.0,
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          color: Color(0xffE06437),
          fontSize: 20.0,
          fontWeight: FontWeight.bold));
}

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    categoriesStore.getCategories();

    return Observer(
      builder: (_) => Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 24,
          ),
          child: jokeGeneratorStore.isLoading
              ? CircularProgressIndicator()
              : _buildCategoriesGridView()),
    );
  }

  GridView _buildCategoriesGridView() {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 140,
            mainAxisExtent: 50,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        itemCount: categoriesStore.categories.length,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            onTap: () {
              jokeGeneratorStore.categorySelected(
                  categoriesStore.categories.elementAt(index), false);
            },
            child: _buildGridItem(index),
          );
        });
  }

  Card _buildGridItem(int index) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        width: 140,
        height: 50,
        child: Text(categoriesStore.categories.elementAt(index),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
