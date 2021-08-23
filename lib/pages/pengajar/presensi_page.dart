import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tpq1/theme.dart';
import 'package:tpq1/widgets/presensi_tile.dart';
import 'package:tpq1/widgets/tanggal_card.dart';

class PresensiPage extends StatefulWidget {
  const PresensiPage({Key? key}) : super(key: key);

  @override
  _PresensiPageState createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  final int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    Widget pageTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          "Presensi",
          style: blackFontStyle1.copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget kehadiranButton(String text, Function onPressed) {
      return Container(
        padding: EdgeInsets.only(top: defaultMargin),
        child: TextButton(
          onPressed: onPressed(),
          style: TextButton.styleFrom(
              fixedSize: Size(80, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: primaryColor),
          child: Text(
            text,
            style: whiteFontStyle3,
          ),
        ),
      );
    }

    Widget kehadiran() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          kehadiranButton("Hadir", () {}),
          kehadiranButton("Izin", () {}),
          kehadiranButton("Sakit", () {}),
        ],
      );
    }

    Widget bulanButton(bool selected, String text) {
      return Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: selected ? primaryColor : Colors.transparent,
          border: Border.all(color: selected ? primaryColor : secondaryColor),
        ),
        child: Text(
          text,
          style: selected ? whiteFontStyle1.copyWith(fontSize: 13) : secondaryFontStyle.copyWith(fontSize: 13),
        ),
      );
    }

    Widget bulan() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin,),
              bulanButton(true, 'Muharram 1443'),
              bulanButton(false, 'Dzulhijjah 1442'),
              bulanButton(false, 'Dzulqadah 1442'),
              bulanButton(false, 'Syaban 1442'),
            ],
          ),
        ),
      );
    }

    Widget kehadiranList() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          children: [
            KehadiranTile(),
            KehadiranTile(),
            KehadiranTile(),
            KehadiranTile(),
            KehadiranTile(),
            KehadiranTile(),
            KehadiranTile(),
            KehadiranTile(),
            KehadiranTile(),
            KehadiranTile(),
            KehadiranTile(),
            KehadiranTile(),
            KehadiranTile(),
            KehadiranTile(),
          ],
        ),
      );
    }

    return ListView(
      padding: EdgeInsets.only(bottom: 60),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pageTitle(),
            TanggalCard(widgetChild: kehadiran()),
            bulan(),
            kehadiranList(),
          ],
        )
      ],
    );
  }
}
