class Joke {
  String id;
  String title;
  String iconUrl;

  Joke({
    required this.id,
    required this.title,
    required this.iconUrl,
  });

  factory Joke.fromMap(Map<String, dynamic> json) => Joke(
    id: json["id"],
    title: json["value"],
    iconUrl: json["icon_url"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "value": title,
    "icon_url": iconUrl,
  };

}