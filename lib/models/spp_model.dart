class SppModel {
  late int id;
  late int jumlah;
  late String keterangan;
  late String bulan;
  late String bukti;
  late DateTime createdAt;
  late bool status;

  SppModel({required this.id, required this.jumlah, required this.keterangan, required this.createdAt, this.bulan = '', this.status = false, this.bukti = ''});

  SppModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jumlah = int.parse(json['jumlah']);
    keterangan = json['keterangan'];
    createdAt = DateTime.parse(json['created_at']);
    bulan = json['bulan'];
    status = json['status'];
    bukti = json['bukti'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jumlah': jumlah.toString(),
      'keterangan': keterangan,
      'bulan': bulan,
      'status': status,
      'bukti': bukti,
      'created_at': createdAt,
    };
  }

}