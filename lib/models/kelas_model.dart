import '../constant.dart';

class KelasModel {
  late int id;
  late String nama;
  late String jenis;

  KelasModel({
    required this.id,
    required this.nama,
    required this.jenis,
  });

  KelasModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama_kelas'];
    jenis = json['jenis_kelas'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_kelas': nama,
      'jenis_kelas': jenis,
    };
  }
}
