class KehadiranSantriModel {
  late int id;
  late String nilaiAdab;
  late String keterangan;
  late String bulan;
  DateTime createdAt = DateTime.now();

  KehadiranSantriModel({this.id = 0, this.nilaiAdab = '', this.keterangan = 'Absen', this.bulan = ''});

  KehadiranSantriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nilaiAdab = json['nilai_adab'] ?? '';
    keterangan = json['keterangan'];
    bulan = json['keterangan'];
    createdAt = DateTime.parse(json['created_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nilai_adab': nilaiAdab,
      'keterangan': keterangan,
      'bulan': bulan,
      'created_at': createdAt.toString(),
    };
  }
}