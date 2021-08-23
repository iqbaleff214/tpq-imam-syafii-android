import 'package:tpq1/models/kehadiran_santri_model.dart';

import '../constant.dart';

class SantriModel {
  late int id;
  late String nis;
  late String namaLengkap;
  late String namaPanggilan;
  late String tempatLahir;
  late String tanggalLahir;
  late String jenisKelamin;
  String foto = '';
  List<KehadiranSantriModel> kehadiran = [];

  SantriModel({
    this.id = 0,
    this.nis = '0A',
    this.namaLengkap = '0A',
    this.namaPanggilan = '0A',
    this.tempatLahir = '0A',
    this.tanggalLahir = '0A',
    this.jenisKelamin = '0A',
  });

  SantriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nis = json['nis'];
    namaLengkap = json['nama_lengkap'];
    namaPanggilan = json['nama_panggilan'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    foto = json['foto'] != null && json['foto'].toString().isNotEmpty
        ? '$baseUrl/storage/' + json['foto'].toString()
        : '';
    kehadiran = json['kehadiran'].map<KehadiranSantriModel>((hadir) => KehadiranSantriModel.fromJson(hadir)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nis': nis,
      'nama_lengkap': namaLengkap,
      'nama_panggilan': namaPanggilan,
      'tempat_lahir': tempatLahir,
      'tanggal_lahir': tanggalLahir,
      'jenis_kelamin': jenisKelamin,
      'foto': foto,
      'kehadiran': kehadiran.map((e) => e.toJson()).toList()
    };
  }
}
