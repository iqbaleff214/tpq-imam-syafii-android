class KurikulumMetodeModel {
  late int id;
  late String metode;

  KurikulumMetodeModel({required this.id, required this.metode});

  KurikulumMetodeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    metode = json['metode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'metode': metode,
    };
  }
}