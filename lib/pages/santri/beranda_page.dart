import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tpq1/models/user_model.dart';
import 'package:tpq1/providers/auth_provider.dart';
import 'package:tpq1/theme.dart';
import 'package:tpq1/widgets/hafalan_card.dart';
import 'package:tpq1/widgets/pembelajaran_card.dart';
import 'package:tpq1/widgets/tanggal_card.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    print(user.foto);

    Widget header() {
      return Container(
        height: 100,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/header-bg-gray.jpg'),
            fit: BoxFit.fitWidth,
            colorFilter: ColorFilter.mode(primaryColor, BlendMode.modulate),
          ),
          color: primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(user.santri.namaPanggilan, style: whiteFontStyle1,),
                Text(user.kelas.nama + ' ' + user.kelas.jenis, style: whiteFontStyle3.copyWith(fontWeight: FontWeight.w300)),
              ],
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: user.foto.isEmpty ? DecorationImage(image: AssetImage( user.santri.jenisKelamin == 'L' ? 'assets/ikhwan-santri.png' : 'assets/akhwat-santri.png',), fit: BoxFit.cover) : DecorationImage(image: NetworkImage(user.foto), fit: BoxFit.cover),
              ),
            )
          ],
        ),
      );
    }

    Widget sectionTitle(String title) {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: blackFontStyle1.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Selengkapnya',
              style: maroonFontStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
      );
    }

    Widget pembelajaran() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        height: 150,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin,),
              Row(
                children: [
                  PembelajaranCard(),
                  PembelajaranCard(),
                  PembelajaranCard(),
                  PembelajaranCard(),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget hafalan() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        height: 150,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin,),
              Row(
                children: [
                  HafalanCard(),
                  HafalanCard(),
                  HafalanCard(),
                  HafalanCard(),
                  HafalanCard(),
                ],
              )
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: EdgeInsets.only(bottom: 60),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            TanggalCard(widgetChild: SizedBox()),
            sectionTitle('Pembelajaran'),
            pembelajaran(),
            sectionTitle('Hafalan'),
            hafalan(),
          ],
        )
      ],
    );
  }
}
