class HonorModel {
  late int id;
  late int jumlah;
  late String keterangan;
  late String bulan;
  late DateTime createdAt;
  late bool status;

  HonorModel({required this.id, required this.jumlah, required this.keterangan, required this.createdAt, this.bulan = '', this.status = false});

  HonorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jumlah = int.parse(json['jumlah']);
    keterangan = json['keterangan'];
    createdAt = DateTime.parse(json['created_at']);
    bulan = json['bulan'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jumlah': jumlah.toString(),
      'keterangan': keterangan,
      'bulan': bulan,
      'status': status,
      'created_at': createdAt,
    };
  }

}