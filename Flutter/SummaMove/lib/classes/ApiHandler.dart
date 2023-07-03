import "dart:convert";
import "dart:developer";
import "package:http/http.dart" as http;

import "package:summamove/models/Exercise.dart";

class ApiHandler {
  static String hostUrl = "http://81.16.177.207:8000/api";
  static String loginEndpoint = "/login";
  static String registerEndpoint = "/register";
  static String logoutEndpoint = "/logout";

  static String exerciseEndpoint = "/exercise";

  Future<List<Exercise>?> login() async {
  }

  Future<List<Exercise>?> register() async {
  }

  Future<List<Exercise>?> logout() async {
  }

  Future<List<Exercise>?> getExercises() async {
    try {
      var url = Uri.parse(hostUrl + exerciseEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final decodedJson = json.decode(response.body);
        final exercisesJson = decodedJson['data']['exercises'];
        List<Exercise> exercises = (exercisesJson as List)
            .map((exerciseJson) => Exercise.fromJson(exerciseJson))
            .toList();
        return exercises;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}