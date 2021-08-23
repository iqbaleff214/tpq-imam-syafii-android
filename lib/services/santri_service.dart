import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tpq1/models/santri_model.dart';
import '../constant.dart';

class SantriService {

  Future<List<SantriModel>> getAllSantri({required String token}) async {

    Uri url = Uri.parse('$baseUrlApi/santri');
    var header = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<SantriModel> allSantri = [];
      for(var item in data) allSantri.add(SantriModel.fromJson(item));
      return allSantri;
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

}