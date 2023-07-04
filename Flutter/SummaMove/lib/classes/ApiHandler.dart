import "dart:convert";
import "dart:developer";
import "package:http/http.dart" as http;

import "package:summamove/models/Exercise.dart";
import "package:summamove/models/Achievement.dart";
import "package:summamove/models/User.dart";

import "../main.dart";

class ApiHandler {
  static String hostUrl = "http://127.0.0.1:8000/api";
  static String loginEndpoint = "/login";
  static String registerEndpoint = "/register";
  static String logoutEndpoint = "/logout";

  static String exerciseEndpoint = "/exercise";
  static String achievementEndpoint = "/achievement";

  Future<User?> login(String email, String password) async {
    try {
      var url = Uri.parse('$hostUrl$loginEndpoint');
      var body = {
        'email': email,
        'password': password,
      };
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        final loginJson = json.decode(response.body)['data'];
        var user = User.fromJson(loginJson['user']);
        currentUser = user;
        currentToken = loginJson['token'];

        return user;
      }
      else {
        log('${StackTrace.current} ''${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<User?> register(String name, String email, String password) async {
    try {
      var url = Uri.parse(hostUrl);
      var body = {
        'name': name,
        'email': email,
        'password': password,
      };
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        final loginJson = json.decode(response.body)['data'];
        var user = User.fromJson(loginJson['user']);
        currentUser = user;
        currentToken = loginJson['token'];

        return user;
      }
      else {
        log('${StackTrace.current} ''${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<String?> logout() async {
    try {
      var url = Uri.parse(hostUrl);
      var response = await http.post(
          url,
          headers: {
            'Authorization': 'Bearer $currentToken',
          },
      );
      if (response.statusCode == 200) {
          return("success");
      }
      else {
        log('${StackTrace.current} ''${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<Exercise>?> getExercises() async {
    try {
      var url = Uri.parse('$hostUrl$exerciseEndpoint');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final exercisesJson = json.decode(response.body)['data']['exercises'];
        List<Exercise> exercises = (exercisesJson as List)
            .map((exercisesJson) => Exercise.fromJson(exercisesJson))
            .toList();
        return exercises;
      }
      else {
        log('${StackTrace.current} ''${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<Achievement>?> getAchievements() async {
    try {
      var url = Uri.parse('$hostUrl$achievementEndpoint');
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $currentToken',
        },
      );
      if (response.statusCode == 200) {
        final achievementsJson = json.decode(response.body)['data']['achievements'];
        List<Achievement> achievements = (achievementsJson as List)
            .map((achievementsJson) => Achievement.fromJson(achievementsJson))
            .toList();
        return achievements;
      }
      else {
        log('${StackTrace.current} ''${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<String?> removeAchievement(int id) async {
    try {
      var url = Uri.parse('$hostUrl$achievementEndpoint/$id');
      var response = await http.delete(
        url,
        headers: {
          'Authorization': 'Bearer $currentToken',
        },
      );
      if (response.statusCode == 200) {
        return('success');
      } else {
        log('${StackTrace.current} ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<String?> updateAchievement(int id, String name, String amount) async {
    try {
      var url = Uri.parse('$hostUrl$achievementEndpoint/$id');
      var response = await http.patch(
        url,
        headers: {
          'Authorization': 'Bearer $currentToken',
        },
        body: {
          'name': name,
          'amount': amount,
        },
      );
      if (response.statusCode == 200) {
        return 'success';
      } else {
        log('${StackTrace.current} ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<Achievement>?> getAchievementsByUser(userId) async {
    try {
      var url = Uri.parse('$hostUrl$achievementEndpoint/user/$userId');
      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $currentToken',
        },
      );
      if (response.statusCode == 200) {
        final achievementsJson = json.decode(response.body)['data']['achievements'];
        List<Achievement> achievements = (achievementsJson as List)
            .map((achievementsJson) => Achievement.fromJson(achievementsJson))
            .toList();
        return achievements;
      }
      else {
        log('${StackTrace.current} ''${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}