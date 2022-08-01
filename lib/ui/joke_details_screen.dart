import 'package:flutter/material.dart';

class JokeDetailsScreen extends StatelessWidget {

  final VoidCallback onBackPressed;
  final String title;
  final String joke;
  final bool isNextJokeButtonEnabled;
  final bool isDetailsScreenVisible;

  JokeDetailsScreen({
    Key? key,
    required this.onBackPressed,
    required this.title,
    required this.joke,
    required this.isNextJokeButtonEnabled,
    required this.isDetailsScreenVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDetailsScreenVisible) {
          onBackPressed.call();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(title),
            elevation: 0,
            toolbarHeight: 72.0,
            centerTitle: true,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.bold),
            leading: GestureDetector(
              child: Icon(Icons.close, color: Colors.black),
              onTap: () {
                onBackPressed.call();
              },
            )),
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 34,
            vertical: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(
                  'https://api.chucknorris.io/img/avatar/chuck-norris.png'),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Text(joke,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            backgroundColor:
                            isNextJokeButtonEnabled == true
                                ? Color.fromRGBO(224, 100, 55, 1)
                                : Color.fromRGBO(224, 100, 55, 1)
                                .withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Text(
                          'Another Random Joke',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        onPressed: () {}),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}