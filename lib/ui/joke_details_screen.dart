import 'package:chuck_norris_joke/stores/jokeGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class JokeDetailsScreen extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onNextJokePressed;
  final String title;
  final String joke;
  final bool isNextJokeButtonEnabled;
  final bool isDetailsScreenVisible;

  JokeDetailsScreen({
    Key? key,
    required this.onBackPressed,
    required this.onNextJokePressed,
    required this.title,
    required this.joke,
    required this.isNextJokeButtonEnabled,
    required this.isDetailsScreenVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jokeGeneratorStore = Provider.of<JokeGenerator>(context);

    return WillPopScope(
      onWillPop: () async {
        if (isDetailsScreenVisible) {
          onBackPressed.call();
          return false;
        }
        return true;
      },
      child: ReactionBuilder(
          builder: (context) {
            return _buildErrorHandlingReaction(jokeGeneratorStore, context);
          },
          child: ReactionBuilder(
            builder: (context) {
              return _buildValidationReaction(jokeGeneratorStore, context);
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: _buildAppBar(),
              body: _buildDetailsContent(jokeGeneratorStore),
            ),
          )),
    );
  }

  ReactionDisposer _buildErrorHandlingReaction(
      JokeGenerator jokeGeneratorStore, BuildContext context) {
    return reaction((_) => jokeGeneratorStore.error, (errorMessage) {
      _handleErrorInUi(errorMessage, context, jokeGeneratorStore);
    });
  }

  void _handleErrorInUi(
    Object? errorMessage,
    BuildContext context,
    JokeGenerator jokeGeneratorStore,
  ) {
    if (errorMessage.toString().isNotEmpty) {
      var snackbarDurationInSeconds = 3;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage.toString()),
          duration: Duration(seconds: snackbarDurationInSeconds)));
      jokeGeneratorStore.error = "";
      jokeGeneratorStore.isLoading = false;
    }
  }

  ReactionDisposer _buildValidationReaction(
      JokeGenerator jokeGeneratorStore, BuildContext context) {
    return reaction((_) => jokeGeneratorStore.isAnotherJokeButtonEnabled,
        (isEnabled) {
      if (isEnabled == false) {
        _handleErrorInUi(
            'No more jokes for this theme', context, jokeGeneratorStore);
      }
    });
  }

  Container _buildDetailsContent(JokeGenerator jokeGeneratorStore) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 34,
        vertical: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Image url is hardcoded, because image from API does not exist
          Image.network(
              'https://api.chucknorris.io/img/avatar/chuck-norris.png'),
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Observer(
              builder: (_) => jokeGeneratorStore.isLoading
                  ? CircularProgressIndicator()
                  : Text(
                      joke,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),
                    ),
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Observer(
                builder: (_) => _buildOutlinedButton(jokeGeneratorStore)),
          )),
        ],
      ),
    );
  }

  OutlinedButton _buildOutlinedButton(JokeGenerator jokeGeneratorStore) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            backgroundColor:
                jokeGeneratorStore.isAnotherJokeButtonEnabled == true
                    ? Color.fromRGBO(224, 100, 55, 1)
                    : Color.fromRGBO(224, 100, 55, 1).withOpacity(0.2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: const Text(
          'Another Random Joke',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        onPressed: jokeGeneratorStore.isAnotherJokeButtonEnabled
            ? () {
                jokeGeneratorStore.isLoading = true;
                onNextJokePressed.call();
              }
            : null);
  }

  AppBar _buildAppBar() {
    return AppBar(
        title: Text(title),
        elevation: 0,
        toolbarHeight: 72.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.bold),
        leading: GestureDetector(
          child: Icon(Icons.close, color: Colors.black),
          onTap: () {
            onBackPressed.call();
          },
        ));
  }
}
