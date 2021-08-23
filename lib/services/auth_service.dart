import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tpq1/models/user_model.dart';
import '../constant.dart';

class AuthService {

  Future<UserModel> autoLogin({required String token}) async {
    Uri url = Uri.parse('$baseUrlApi/user');
    var header = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      print(data);
      UserModel user = UserModel.fromJson(data['user']);
      user.token = token;
      return user;
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

  Future<UserModel> login(
      {required String username, required String password}) async {
    Uri url = Uri.parse('$baseUrlApi/login');
    var header = {'Content-Type': 'application/json'};
    var body = jsonEncode({'username': username, 'password': password});

    var response = await http.post(url, headers: header, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      throw Exception('Gagal login');
    }
  }

  Future<bool> logout({required String token}) async {
    Uri url = Uri.parse('$baseUrlApi/logout');
    var header = {
      'Accept': 'application/json',
      'Authorization': token
    };

    var response = await http.post(url, headers: header, body: {});

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal logout');
    }
  }
}