import '../constant.dart';

class WaliModel {
  late int id;
  late String nama;
  late String hubungan;
  late String nomorTelepon;

  WaliModel({
    required this.id,
    required this.nama,
    required this.hubungan,
    required this.nomorTelepon,
  });

  WaliModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama_wali'];
    hubungan = json['hubungan'];
    nomorTelepon = json['no_telp'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_wali': nama,
      'hubungan': hubungan,
      'nomor_telepon': nomorTelepon,
    };
  }
}
