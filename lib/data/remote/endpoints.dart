class Endpoints {
  Endpoints._();

  static const String baseUrl = "api.chucknorris.io";

  static const int receiveTimeout = 15000;

  static const int connectionTimeout = 30000;

  static const String getCategories = "/jokes/categories";
  static const String getRandomJoke = "/jokes/random";
}