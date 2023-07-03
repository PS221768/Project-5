class Achievement {
  int id;

  Achievement({
    required this.id,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
    id: json["id"],
  );
}
