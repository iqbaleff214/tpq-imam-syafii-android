import 'package:tpq1/models/wali_model.dart';

import '../constant.dart';

class SantriModel {
  late int id;
  late String nis;
  late String namaLengkap;
  late String namaPanggilan;
  late String tempatLahir;
  late DateTime tanggalLahir;
  late String jenisKelamin;
  late String alamat;
  String foto = '';
  List<WaliModel> wali = [];

  SantriModel({
    this.id = 0,
    this.nis = '',
    this.namaLengkap = '',
    this.namaPanggilan = '',
    this.tempatLahir = '',
    required this.tanggalLahir,
    this.jenisKelamin = '',
    this.alamat = '',
  });

  SantriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nis = json['nis'] ?? '';
    namaLengkap = json['nama_lengkap'] ?? '';
    namaPanggilan = json['nama_panggilan'] ?? namaLengkap;
    tempatLahir = json['tempat_lahir'] ?? '';
    tanggalLahir = DateTime.parse(json['tanggal_lahir']);
    jenisKelamin = json['jenis_kelamin'] ?? '';
    alamat = json['alamat'] ?? '';
    foto = json['foto'] != null && json['foto'].toString().isNotEmpty
        ? '$baseUrl/storage/' + json['foto'].toString()
        : '';
    wali = json['wali'].map<WaliModel>((wali) => WaliModel.fromJson(wali)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nis': nis,
      'nama_lengkap': namaLengkap,
      'nama_panggilan': namaPanggilan,
      'tempat_lahir': tempatLahir,
      'tanggal_lahir': tanggalLahir.toString(),
      'jenis_kelamin': jenisKelamin,
      'alamat': alamat,
      'foto': foto,
      'wali': wali.map((e) => e.toJson()).toList()
    };
  }
}
