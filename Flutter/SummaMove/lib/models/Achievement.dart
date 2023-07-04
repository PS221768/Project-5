class Achievement {
  int id;
  String name;
  int amount;
  String start;
  String finish;
  int userId;
  int exerciseId;

  Achievement({
    required this.id,
    required this.name,
    required this.amount,
    required this.start,
    required this.finish,
    required this.userId,
    required this.exerciseId,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
    id: json["id"],
    name: json['name'],
    amount: json['amount'],
    start: json['start'].toString(),
    finish: json['finish'].toString(),
    userId: json['user_id'],
    exerciseId: json['exercise_id'],
  );
}
