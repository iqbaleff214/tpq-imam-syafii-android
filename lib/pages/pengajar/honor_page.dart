import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tpq1/theme.dart';
import 'package:tpq1/widgets/honor_tile.dart';

class HonorPage extends StatefulWidget {
  const HonorPage({Key? key}) : super(key: key);

  @override
  _HonorPageState createState() => _HonorPageState();
}

class _HonorPageState extends State<HonorPage> {
  final int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    Widget pageTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          "Honor",
          style: blackFontStyle1.copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget tahunButton(bool selected, String text) {
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

    Widget tahun() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin,),
              tahunButton(true, '1443'),
              tahunButton(false, '1442'),
              tahunButton(false, '1441'),
              tahunButton(false, '1440'),
              tahunButton(false, '1440'),
              tahunButton(false, '1440'),
              tahunButton(false, '1440'),
              tahunButton(false, '1440'),
              tahunButton(false, '1440'),
            ],
          ),
        ),
      );
    }

    Widget honorList() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          children: [
            HonorTile(),
            HonorTile(),
            HonorTile(),
            HonorTile(),
            HonorTile(),
            HonorTile(),
            HonorTile(),
            HonorTile(),
            HonorTile(),
            HonorTile(),
            HonorTile(),
            HonorTile(),
            HonorTile(),
            HonorTile(),
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
            tahun(),
            honorList(),
          ],
        )
      ],
    );
  }
}
