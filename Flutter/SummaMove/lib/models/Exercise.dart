class Exercise {
  int id;
  String name;
  String description_nl;
  String description_en;

  Exercise({
    required this.id,
    required this.name,
    required this.description_nl,
    required this.description_en,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    id: json["id"],
    name: json["name"],
    description_nl: json["description_nl"],
    description_en: json["description_en"],
  );

  dynamic operator [](String key) {
    switch (key) {
      case 'description_nl':
        return description_nl;
      case 'description_en':
        return description_en;
      default:
        throw ArgumentError("Invalid property: $key");
    }
  }
}
