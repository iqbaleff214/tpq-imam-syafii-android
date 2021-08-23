import 'package:flutter/material.dart';
import 'package:tpq1/theme.dart';

class PembelajaranCard extends StatelessWidget {
  const PembelajaranCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: defaultMargin, top: 10, bottom: 10),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(spreadRadius: 1.5, blurRadius: 8, color: Colors.black12)
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('A+', style: blackFontStyle1.copyWith(fontSize: 36, fontWeight: FontWeight.bold)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('14 Rabiual Awwal 1443', style: blackFontStyle1.copyWith(fontSize: 12), overflow: TextOverflow.ellipsis,),
                    Text('5 Februari 2022', style: greyFontStyle.copyWith(fontSize: 12), overflow: TextOverflow.ellipsis, textAlign: TextAlign.end,),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5,),
            Text('Iqro Jilid 2: Hal. 4-5', style: greyFontStyle.copyWith(fontSize: 14),),
          ],
        ),
      ),
    );
  }
}
