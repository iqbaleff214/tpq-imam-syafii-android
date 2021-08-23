import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tpq1/models/user_model.dart';
import 'package:tpq1/providers/auth_provider.dart';
import 'package:tpq1/providers/santri_provider.dart';
import 'package:tpq1/theme.dart';
import 'package:tpq1/widgets/santri_card.dart';
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

    SantriProvider santriProvider = Provider.of<SantriProvider>(context);

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
                Text(
                  user.pengajar.nama,
                  style: whiteFontStyle1,
                ),
                Text(user.kelas.nama + ' ' + user.kelas.jenis,
                    style:
                        whiteFontStyle3.copyWith(fontWeight: FontWeight.w300)),
              ],
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: user.foto.isEmpty
                    ? DecorationImage(
                        image: AssetImage(
                          user.pengajar.jenisKelamin == 'L'
                              ? 'assets/ikhwan.png'
                              : 'assets/akhwat.png',
                        ),
                        fit: BoxFit.cover)
                    : DecorationImage(
                        image: NetworkImage(user.foto), fit: BoxFit.cover),
              ),
            )
          ],
        ),
      );
    }

    Widget santriTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          "Santri",
          style: blackFontStyle1.copyWith(
              fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget santri() {
      return Container(
        height: 260,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: santriProvider.allSantri
                    .map<Widget>((santri) => SantriCard(santri))
                    .toList(),
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
            santriTitle(),
            santri(),
          ],
        )
      ],
    );
  }
}
