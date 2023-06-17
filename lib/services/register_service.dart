import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_no_lote/models/User.dart';

Future createUser(User user) async {
  http.Response response;
  response = await http.post(
      Uri.parse("http://192.168.0.105:8000/api/v1/auth/users"),
      body: json.encode(user.toJson()),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      });
  print("-------" + response.body);
  if (response.statusCode == 200 || response.statusCode == 201) {
    return true;
  } else {
    print(response.body);

    return response.body;
  }
}
