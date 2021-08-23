class KehadiranPengajarModel {
  late int id;
  DateTime datang = DateTime.now();
  late String keterangan;
  late String bulan;
  DateTime createdAt = DateTime.now();

  KehadiranPengajarModel({this.id = 0, this.keterangan = 'Hadir', this.bulan = ''});

  KehadiranPengajarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    datang = json['datang'];
    keterangan = json['keterangan'];
    bulan = json['keterangan'];
    createdAt = DateTime.parse(json['created_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'datang': datang,
      'keterangan': keterangan,
      'bulan': bulan,
      'created_at': createdAt.toString(),
    };
  }
}