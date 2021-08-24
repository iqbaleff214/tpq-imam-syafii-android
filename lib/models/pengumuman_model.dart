class PengumumanModel {
  late int id;
  late String judul;
  late String konten;
  late DateTime createdAt;

  PengumumanModel({required this.id, required this.judul, required this.konten, required this.createdAt});

  PengumumanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    konten = json['konten'];
    createdAt = DateTime.parse(json['created_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'konten': konten,
      'created_at': createdAt,
    };
  }

}