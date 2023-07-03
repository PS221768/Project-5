class Exercise {
  int id;
  String name;
  String description;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );
}
