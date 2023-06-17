// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:scoped_model/scoped_model.dart';
import 'dart:core';

class User {
  String _token;
  int? _id;
  String _name;
  String _nif;
  String _phone;
  String _email;
  String _birthdate;
  String _password;

  User(this._token, this._id, this._name, this._nif, this._phone, this._email,
      this._birthdate, this._password);

  // Getters
  String get token => _token;
  int? get id => _id;
  String get name => _name;
  String get nif => _nif;
  String get phone => _phone;
  String get email => _email;
  String get birthdate => _birthdate;
  String get password => _password;

  // Setters
  set id(int? id) {
    _id = id;
  }

  set name(String name) {
    _name = name;
  }

  set nif(String nif) {
    _nif = nif;
  }

  set phone(String phone) {
    _phone = phone;
  }

  set email(String email) {
    _email = email;
  }

  set birthdate(String birthdate) {
    _birthdate = birthdate;
  }

  set password(String password) {
    _password = password;
  }

  Map<String, dynamic> toJson() {
    return {
      "name": _name,
      "nif": _nif,
      "phone": _phone,
      "email": _email,
      "birthdate": _birthdate,
      "password": _password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['data']['token'],
      json['data']['user']['id'],
      json['data']['user']['name'],
      json['data']['user']['nif'],
      json['data']['user']['phone'],
      json['data']['user']['email'],
      json['data']['user']['birthdate'],
      "",
    );
  }
}
