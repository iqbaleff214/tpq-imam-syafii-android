import 'package:flutter/foundation.dart';
import 'package:tpq1/models/santri_model.dart';
import 'package:tpq1/services/santri_service.dart';

class SantriProvider with ChangeNotifier {
  List<SantriModel> _allSantri = [];

  List<SantriModel> get allSantri => _allSantri;
  set allSantri(List<SantriModel> allSantri) {
    _allSantri = allSantri;
    notifyListeners();
  }

  Future<void> getAllSantri({required String token}) async {
    try {
      List<SantriModel> allSantri = await SantriService().getAllSantri(token: token);
      _allSantri = allSantri;
    } catch (e) {
      print(e);
    }
  }



}