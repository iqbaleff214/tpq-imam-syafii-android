class KehadiranPengajarModel {
  late int id;
  late DateTime? datang;
  late DateTime? pulang;
  late String keterangan;
  late String bulan;
  DateTime createdAt = DateTime.now();

  KehadiranPengajarModel({this.id = 0, this.keterangan = 'Hadir', this.bulan = '', this.datang, this.pulang});

  KehadiranPengajarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    datang = DateTime.parse(json['datang']);
    pulang = DateTime.parse(json['pulang']);
    keterangan = json['keterangan'];
    bulan = json['keterangan'];
    createdAt = DateTime.parse(json['created_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'datang': datang?.toString(),
      'pulang': pulang?.toString(),
      'keterangan': keterangan,
      'bulan': bulan,
      'created_at': createdAt.toString(),
    };
  }
}