import 'package:tpq1/models/pengajar_model.dart';
import 'package:tpq1/models/santri_model.dart';

import 'kelas_model.dart';

class UserModel {
  late int id;
  late String username;
  late String email;
  late String role;
  late String token;
  String foto = '';
  PengajarModel pengajar = new PengajarModel();
  SantriModel santri = new SantriModel();
  KelasModel kelas = new KelasModel(id: 0, nama: 'A3', jenis: 'A3');

  UserModel({required this.id, required this.username, required this.email, required this.role, required this.token, required this.foto});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    role = json['peran'];
    try {
      token = json['token'];
    } catch (e) {
      token = '';
    }
    if (role == 'Pengajar') {
      pengajar = PengajarModel.fromJson(json['pengajar']);
      foto = pengajar.foto;
    } else {
      santri = SantriModel.fromJson(json['santri']);
      foto = santri.foto;
    }
    try {
      kelas = KelasModel.fromJson(json['kelas']);
    } catch (e) {
      kelas = KelasModel.fromJson(json[role.toLowerCase()]['kelas']);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'username': username,
      'email': email,
      'peran': role,
      'token': token,
      'foto': foto,
      'pengajar': pengajar.toJson(),
      'santri': santri.toJson(),
      'kelas': kelas.toJson(),
    };
  }

}
