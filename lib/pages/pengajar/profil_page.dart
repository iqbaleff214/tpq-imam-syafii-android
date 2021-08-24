import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tpq1/models/user_model.dart';
import 'package:tpq1/providers/auth_provider.dart';
import 'package:tpq1/theme.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final int selectedIndex = 4;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    handleLogout() async {
      setState(() {
        isLoading = true;
      });
      if (await authProvider.logout(token: user.token)) {
        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
        } catch (e) {
          print(e);
        }
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        width: double.infinity,
        height: 250,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: user.foto.isEmpty
                  ? Image.asset(
                      user.pengajar.jenisKelamin == 'L' ? 'assets/ikhwan.png' : 'assets/akhwat.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      user.foto,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Text(
              user.pengajar.nama,
              style: blackFontStyle1,
            ),
            Text(
              user.kelas.nama + ' ' + user.kelas.jenis,
              style: greyFontStyle,
            )
          ],
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryFontStyle.copyWith(fontSize: 13),
            ),
            Icon(
              Icons.chevron_right,
              color: secondaryColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          margin: EdgeInsets.only(top: defaultMargin),
          padding: EdgeInsets.all(defaultMargin),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profil',
                style: blackFontStyle1.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                child: menuItem('Biodata'),
                onTap: () {
                  Navigator.pushNamed(context, '/pengajar/biodata');
                },
              ),
              GestureDetector(
                child: menuItem('Kontak'),
                onTap: () {
                  Navigator.pushNamed(context, '/pengajar/kontak');
                },
              ),
              GestureDetector(
                child: menuItem('Akun'),
                onTap: () {
                  Navigator.pushNamed(context, '/pengajar/akun');
                },
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Umum',
                style: blackFontStyle1.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              menuItem('Kurikulum'),
              menuItem('Tentang'),
              GestureDetector(
                child: menuItem('Keluar'),
                onTap: () {
                  handleLogout();
                },
              ),
              isLoading ? primaryLoadingIndicator : SizedBox(),
            ],
          ));
    }

    // return Text('Tes');

    return ListView(
      padding: EdgeInsets.only(bottom: 60),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            content(),
          ],
        )
      ],
    );
  }
}
