import '../constant.dart';

class PengajarModel {
  late int id;
  late String nama;
  late String tempatLahir;
  late String tanggalLahir;
  late String jenisKelamin;
  late String nomorTelepon;
  late String alamat;
  String foto = '';

  PengajarModel(
      {this.id = 0,
      this.nama = '0A',
      this.tempatLahir = '0A',
      this.tanggalLahir = '0A',
      this.jenisKelamin = '0A',
      this.nomorTelepon = '0A',
      this.alamat = '0A',});

  PengajarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    nomorTelepon = json['no_telp'];
    alamat = json['alamat'];
    foto = json['foto'] != null && json['foto'].toString().isNotEmpty
        ? '$baseUrl/storage/' + json['foto'].toString()
        : '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'tempat_lahir': tempatLahir,
      'tanggal_lahir': tanggalLahir,
      'jenis_kelamin': jenisKelamin,
      'no_telp': nomorTelepon,
      'alamat': alamat,
      'foto': foto,
    };
  }
}
