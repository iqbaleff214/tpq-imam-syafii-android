import 'package:tpq1/models/kurikulum_bahan_model.dart';
import 'package:tpq1/models/kurikulum_materi_model.dart';
import 'package:tpq1/models/kurikulum_metode_model.dart';

class KurikulumModel {
  late int id;
  late String tingkat;
  late String mulai;
  late String selesai;
  late String target;
  late String keterangan;
  List<KurikulumBahanModel> bahan = [];
  List<KurikulumMateriModel> materi = [];
  List<KurikulumMetodeModel> metode = [];

  KurikulumModel({
    required this.id,
    required this.tingkat,
    required this.mulai,
    required this.selesai,
    required this.target,
    required this.keterangan,
    required this.bahan,
    required this.materi,
    required this.metode,
  });

  KurikulumModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tingkat = json['tingkat'];
    mulai = json['mulai'];
    selesai = json['selesai'];
    target = json['target'];
    keterangan = json['keterangan'];
    bahan = json['bahan'].map<KurikulumBahanModel>((bahan) => KurikulumBahanModel.fromJson(bahan)).toList();
    materi = json['materi'].map<KurikulumMateriModel>((materi) => KurikulumMateriModel.fromJson(materi)).toList();
    metode = json['metode'].map<KurikulumMetodeModel>((metode) => KurikulumMetodeModel.fromJson(metode)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tingkat': tingkat,
      'mulai': mulai,
      'selesai': selesai,
      'target': target,
      'keterangan': keterangan,
      'bahan': bahan.map((bahan) => bahan.toJson()).toList(),
      'materi': materi.map((materi) => materi.toJson()).toList(),
      'metode': metode.map((metode) => metode.toJson()).toList(),
    };
  }
}
