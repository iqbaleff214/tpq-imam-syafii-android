import 'package:flutter/material.dart';
import 'package:tpq1/theme.dart';
import 'package:tpq1/widgets/info_tile.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {

    Widget pageTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          "Informasi",
          style: blackFontStyle1.copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget pencarian() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: defaultMargin),
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 1.5, color: secondaryColor)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextField(
              // controller: cariController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: greyFontStyle,
                hintText: 'Cari informasi',
              ),
            ),
          ),
      );
    }

    Widget info() {
      return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      child: Column(
        children: [
          InfoTile(),
          InfoTile(),
          InfoTile(),
          InfoTile(),
          InfoTile(),
          InfoTile(),
          InfoTile(),
          InfoTile(),
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
            pencarian(),
            info(),
          ],
        )
      ],
    );
  }
}
