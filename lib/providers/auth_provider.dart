import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tpq1/models/user_model.dart';
import 'package:tpq1/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user = new UserModel(id: 0, username: 'A', email: 'A', role: 'A', token: 'A', foto: '');
  late SharedPreferences _pref;

  UserModel get user => _user;

  AuthProvider() {
    _loadFromPrefs();
  }

  _initPref() async {
    _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPref();
    String? userlogin = _pref.getString('rememberme');
    String? userFoto = _pref.getString('rememberfoto');
    if (userlogin != null) {
      var decode = jsonDecode(userlogin);
      _user = UserModel.fromJson(decode);
      _user.foto = userFoto ?? '';
      notifyListeners();
    }
  }

  _saveToPrefs() async {
    await _initPref();
    _pref.setString('rememberme', jsonEncode(_user));
  }

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login({required String username, required String password}) async {
    try {
      UserModel user = await AuthService().login(username: username, password: password);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> logout({required String token}) async {
    try {
      return await AuthService().logout(token: token);
    } catch (e) {
      print(e);
      return false;
    }
  }

}