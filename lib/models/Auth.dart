import 'package:to_no_lote/models/User.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';
import '../services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthModel extends Model {
  User? _user;
  ApiSignin apiSignin = ApiSignin();
  bool isLoggedIn = false;
  User? get user => _user;
  Future<bool> loadSettings() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    User _savedUser;
    try {
      String? _saved = _prefs.getString("user_data");

      try {
        _savedUser = User.fromJson(json.decode(_saved!));
        if (_savedUser != null) {
          isLoggedIn = true;
          _user = _savedUser;
          notifyListeners();
          return isLoggedIn;
        }
        print('erro ao pegar dados');
        await logout();
        return false;
      } catch (e) {
        print('erro ao pegar dados ${e}');
        // await logout();
        return false;
      }
    } catch (e) {
      print("User Not Found: $e");
    }
    return false;
  }

  recoveryPassword(String email) async {
    var success = true;
    // var sucess = await apiSignin.recoveryPassword(email);
    return success;
  }

  login(String username, String password) async {
    _user = await apiSignin.login(username, password);
    print(_user);

    if (_user != null) {
      isLoggedIn = true;

      await SharedPreferences.getInstance().then((prefs) {
        var _save = json.encode(_user!.toJson());
        prefs.setString("user_data", _save);
        prefs.setString("token", _user!.token);
      });
    }

    if (_user?.token == null || _user!.token.isEmpty) {
      isLoggedIn = false;
      return false;
    }
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    _user = null;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("user_data", '');
      prefs.setString("token", '');
//      prefs.setString("use_bio", null);
    });

    isLoggedIn = false;
    return;
  }
}
