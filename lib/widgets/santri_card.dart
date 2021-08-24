import 'package:flutter/material.dart';
import 'package:tpq1/models/santri_model.dart';
import 'package:tpq1/pages/pengajar/santri_detail_page.dart';
import 'package:tpq1/theme.dart';

class SantriCard extends StatelessWidget {
  // const SantriCard({Key? key}) : super(key: key);

  final SantriModel santri;
  SantriCard(this.santri);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SantriDetailPage(santri)));
      },
      child: Container(
        width: 180,
        height: 200,
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(spreadRadius: 3, blurRadius: 10, color: Colors.black12)
            ]),
        child: Column(
          children: [
            Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
                image: santri.foto.isEmpty ? DecorationImage(image: AssetImage('assets/ikhwan-santri.png'), fit: BoxFit.cover) : DecorationImage(image: NetworkImage(santri.foto), fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 10, 12, 6),
              width: 180,
              child: Text(
                santri.namaPanggilan,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(santri.namaLengkap, style: greyFontStyle.copyWith(fontSize: 12), overflow: TextOverflow.ellipsis,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
