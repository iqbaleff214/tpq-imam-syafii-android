import '../constant.dart';

class PembelajaranModel {
  late int id;
  late int? mulai;
  late int? selesai;
  late String nilai;
  late String keterangan;
  late String bulan = '';

  PembelajaranModel({
    required this.id,
    this.mulai,
    this.selesai,
    required this.nilai,
    required this.keterangan,
  });

  PembelajaranModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mulai = int.parse(json['mulai']) ?? 1;
    selesai = int.parse(json['selesai']) ?? mulai;
    nilai = json['nilai'];
    keterangan = json['keterangan'] ?? 'Lancar';
    bulan = json['bulan'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mulai': mulai.toString(),
      'selesai': selesai.toString(),
      'nilai': nilai,
      'keterangan': keterangan,
      'bulan': bulan,
    };
  }
}
