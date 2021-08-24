import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tpq1/models/santri_model.dart';
import 'package:tpq1/theme.dart';

class SantriDetailPage extends StatefulWidget {
  // const SantriDetailPage({Key? key}) : super(key: key);

  final SantriModel santri;

  SantriDetailPage(this.santri);

  @override
  _SantriDetailPageState createState() => _SantriDetailPageState();
}

class _SantriDetailPageState extends State<SantriDetailPage> {
  @override
  Widget build(BuildContext context) {

    int calculateAge(DateTime birthDate) {
      DateTime currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;
      int month1 = currentDate.month;
      int month2 = birthDate.month;
      if (month2 > month1) {
        age--;
      } else if (month1 == month2) {
        int day1 = currentDate.day;
        int day2 = birthDate.day;
        if (day2 > day1) {
          age--;
        }
      }
      return age;
    }

    Widget backButton() {
      return Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(3),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black12),
              child: Image.asset('assets/back_arrow_white.png'),
            ),
          ),
        ),
      );
    }

    Widget nama() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                child: Text(
                  widget.santri.namaPanggilan,
                  style: blackFontStyle2.copyWith(fontSize: 20),
                ),
              ),
              Text(
                widget.santri.nis,
                style: greyFontStyle,
              )
            ],
          ),
          Text( calculateAge(widget.santri.tanggalLahir).toString() + ' thn', style: greyFontStyle.copyWith(fontSize: 16)),
        ],
      );
    }

    Widget sectionItem(String label, String item) {
      var width = MediaQuery.of(context).size.width / 2 - defaultMargin - 5;
      return Container(
        margin: EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
                width: width,
                child: Text(
                  label,
                  style: greyFontStyle,
                )),
            SizedBox(
                width: width,
                child: Text(item,
                    style: blackFontStyle3, textAlign: TextAlign.right))
          ],
        ),
      );
    }

    Widget section(String sectionName, List<Widget> rows) {
      rows.insert(
          0,
          Container(
            // padding: EdgeInsets.only(top: 16, bottom: 8),
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              sectionName,
              style: blackFontStyle3,
            ),
          ));
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rows,
      );
    }

    Widget content() {
      return SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                backButton(),
                Container(
                  margin: EdgeInsets.only(top: 200),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white),
                  padding: EdgeInsets.only(
                      top: defaultMargin,
                      right: defaultMargin,
                      left: defaultMargin,
                      bottom: 400),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      nama(),
                      section('Biodata', [
                        sectionItem('Nama Lengkap', widget.santri.namaLengkap),
                        sectionItem(
                            'Nama Panggilan', widget.santri.namaPanggilan),
                        sectionItem('Tempat Lahir', widget.santri.tempatLahir),
                        sectionItem(
                            'Tanggal Lahir', DateFormat('d MMMM yyyy', 'id').format(widget.santri.tanggalLahir)),
                        sectionItem('Alamat', widget.santri.alamat),
                      ]),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.santri.wali
                            .map<Widget>((wali) => section('Wali Santri', [
                                  sectionItem('Nama', wali.nama),
                                  sectionItem('Hubungan', wali.hubungan),
                                  sectionItem(
                                      'Nomor Telepon', wali.nomorTelepon),
                                ]))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: primaryColor,
          ),
          SafeArea(
              child: Container(
            color: lightColor,
          )),
          SafeArea(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: widget.santri.foto.isEmpty
                    ? DecorationImage(
                        image: AssetImage('assets/ikhwan-santri.png'),
                        fit: BoxFit.cover)
                    : DecorationImage(
                        image: NetworkImage(widget.santri.foto),
                        fit: BoxFit.cover),
              ),
            ),
          ),
          content(),
        ],
      ),
    );
  }
}
