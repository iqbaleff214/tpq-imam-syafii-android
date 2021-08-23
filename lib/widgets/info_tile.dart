import 'package:flutter/material.dart';
import 'package:tpq1/theme.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: defaultMargin, left: defaultMargin, bottom: defaultMargin),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Judul',
                style: blackFontStyle1.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                '27 April 2021',
                style: greyFontStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          SizedBox(height: 6,),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at interdum arcu. Interdum et malesuada fames ac ante ipsum primis in faucibus....',
            style: secondaryFontStyle,
          )
        ],
      ),
    );
  }
}
