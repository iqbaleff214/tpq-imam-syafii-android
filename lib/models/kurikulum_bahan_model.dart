class KurikulumBahanModel {
  late int id;
  late String bahan;

  KurikulumBahanModel({required this.id, required this.bahan});

  KurikulumBahanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bahan = json['bahan'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bahan': bahan,
    };
  }
}