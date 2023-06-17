import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/User.dart';

const BASE_URL = "http://192.168.0.105:8000/";

class ApiSignin {
  login(String username, String password) async {
    try {
      http.Response response = await http.post(
          Uri.parse(BASE_URL + 'api/v1/auth/login'),
          body: toJson(username, password));
      print(">>>>>>>>>>>>>>>>>>Response body: " + response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var t = json.decode(utf8.decode(response.bodyBytes));
        print(t);

        var decoded = json.decode(utf8.decode(response.bodyBytes));
        decoded['access_token'] = t['token'];
        return decode(decoded);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Map<String, dynamic> toJson(username, password) {
    return {"email": username, "password": password};
  }

  decode(response) {
    try {
      return User.fromJson(response);
    } catch (e) {
      print("----Error----- ${e}");
    }
  }

  getuserInfor(http.Response response, token) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      var decoded = json.decode(utf8.decode(response.bodyBytes));
      return decode(decoded);
    } else {
      return null;
    }
  }
}
