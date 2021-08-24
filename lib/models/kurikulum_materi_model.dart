class KurikulumMateriModel {
  late int id;
  late String materi;

  KurikulumMateriModel({required this.id, required this.materi});

  KurikulumMateriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    materi = json['materi'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'materi': materi,
    };
  }
}