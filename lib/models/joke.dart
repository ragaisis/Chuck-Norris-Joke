class Joke {
  String title;
  String iconUrl;

  Joke({
    required this.title,
    required this.iconUrl,
  });

  factory Joke.fromMap(Map<String, dynamic> json) => Joke(
    title: json["value"],
    iconUrl: json["icon_url"],
  );

  Map<String, dynamic> toMap() => {
    "value": title,
    "icon_url": iconUrl,
  };

}