import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

register_lots(zip_code, public_place, number, district, city_id, length, price,
    type, lat, long, width, sale_type, description, images) async {
  var _prefs = await SharedPreferences.getInstance();
  String? token = _prefs.getString("token");
  //criar service
  var url = Uri.parse('http://192.168.0.112:8080/api/v1/auth/lots');
  var request = http.MultipartRequest('POST', url);
  // Adicione os campos do formulário, se necessário
  request.fields['zip_code'] = zip_code;
  request.fields['public_place'] = public_place;
  request.fields['number'] = number;
  request.fields['district'] = district;
  request.fields['city_id'] = city_id;
  request.fields['length'] = length;
  request.fields['price'] = price;
  request.fields['type'] = type;
  request.fields['lat'] = lat;
  request.fields['long'] = long;
  request.fields['width'] = width;

  for (int i = 0; i < sale_type.length; i++) {
    request.fields['sale_types[$i][id]'] = sale_type[i]['id'].toString();
  }
  request.fields['description'] = description;
  Map<String, String> headers = {
    "Content-Type": "multipart/form-data",
    "Authorization": "Bearer $token"
  };
  request.headers.addAll(headers);
  if (images != null) {
    for (int i = 0; i < images!.length; i++) {
      var fieldName = 'images[]'; // Nome do campo de arquivo
      var file = await http.MultipartFile.fromPath(
        fieldName,
        images![i].path,
      );
      request.files.add(file);
    }
  }

  var response = await request.send();
  if (response.statusCode == 201) {
    print('Post enviado com sucesso');
    return true;
  } else {
    print('Falha ao enviar o post. Código de status: ${response.statusCode}');
    return false;
  }
}

get_lots() async {
  var _prefs = await SharedPreferences.getInstance();
  String? token = _prefs.getString("token");

  var url = Uri.parse('http://192.168.0.112:8080/api/v1/lots');
  var response =
      await http.get(url, headers: {"Authorization": "Bearer $token"});
  if (response.statusCode == 200) {
    print("sucesso ${response.body}");
    var data = json.decode(utf8.decode(response.bodyBytes));
    return data['data'];
  }
  print("status code ${response.statusCode}");
  print("erro2 ${response.body} status code ${response.body}");
  return [];
}
