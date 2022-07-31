import 'package:chuck_norris_joke/stores/categories.dart';
import 'package:chuck_norris_joke/ui/joke_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../stores/jokeGenerator.dart';
import '../widgets/search_field_widget.dart';

final jokeGenerator = JokeGenerator();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => Categories(),
      child: Stack(children: [
        Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
              title: Text('CHUCK NORRIS'),
              elevation: 0,
              toolbarHeight: 72.0,
              centerTitle: true,
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(
                  color: Color(0xffE06437),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          body: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                    left: 38, top: 2, right: 38, bottom: 24),
                child: Observer(
                  builder: (_) => SearchFieldWidget(
                    hintText: jokeGenerator.isSearchActive
                        ? ''
                        : 'Search for a random joke',
                    onClearPressed: () async {
                      jokeGenerator.setSearchActiveState(false);
                    },
                    onFocusChanged: (hasFocus) async {
                      jokeGenerator.setSearchActiveState(hasFocus);
                    },
                    onQuerySubmitted: (query) async {
                      jokeGenerator.searchByQuery(query);
                    },
                  ),
                ),
              ),
              Observer(
                builder: (_) => Text(jokeGenerator.isSearchActive
                    ? 'Search for a random joke'
                    : 'Or choose a category'),
              ),
              CategoriesGrid()
            ],
          )),
          floatingActionButton: FloatingActionButton(
            onPressed: () => {
              jokeGenerator.closeDetailsScreen(),
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
        Observer(
            builder: (_) => Visibility(
                child: JokeDetailsScreen(
                  title: jokeGenerator.detailsTitle,
                  isDetailsScreenVisible: jokeGenerator.isDetailsScreenVisible,
                  isNextJokeButtonEnabled:
                      jokeGenerator.isAnotherJokeButtonEnabled,
                  onBackPressed: () {
                    jokeGenerator.closeDetailsScreen();
                  },
                ),
                visible: jokeGenerator.isDetailsScreenVisible))
      ]),
    );
  }
}

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<Categories>(context);
    list.getCategories();

    return Observer(
      builder: (_) => Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 24,
          ),
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 140,
                  mainAxisExtent: 50,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16),
              itemCount: list.categories.length,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  onTap: () {
                    jokeGenerator
                        .categorySelected(list.categories.elementAt(index));
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      width: 140,
                      height: 50,
                      child: Text(list.categories.elementAt(index),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                );
              })),
    );
  }
}
