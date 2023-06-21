import 'dart:convert';
import 'package:http/http.dart' as http;

get_cities() async {
  var url = Uri.parse('http://192.168.0.112:8080/api/v1/cities');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var data = json.decode(utf8.decode(response.bodyBytes));
    return data;
  }
  return [];
}


