import 'package:flutter/material.dart';
import 'package:tpq1/theme.dart';

class KehadiranTile extends StatelessWidget {
  const KehadiranTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin, bottom: defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('15 Ramadan 1442', style: blackFontStyle1.copyWith(fontSize: 16),),
              Text('27 April 2021', style: greyFontStyle,),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('10.33 - 12.00', style: blackFontStyle1.copyWith(fontSize: 16),),
              Text('Hadir', style: greyFontStyle,),
            ],
          ),
        ],
      ),
    );
  }
}
