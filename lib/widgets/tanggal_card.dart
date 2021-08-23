import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:tpq1/theme.dart';

class TanggalCard extends StatelessWidget {
  // const TanggalCard({Key? key}) : super(key: key);

  final Widget widgetChild;

  TanggalCard({required this.widgetChild});

  @override
  Widget build(BuildContext context) {
    var _today = new HijriCalendar.now();
    return Container(
      margin: EdgeInsets.only(
          top: defaultMargin, left: defaultMargin, right: defaultMargin),
      width: double.infinity,
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
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat("EEEE","id_ID").format(DateTime.now()), style: blackFontStyle1.copyWith(fontSize: 16)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(_today.toFormat("dd MMMM yyyy"), style: blackFontStyle1.copyWith(fontSize: 16), overflow: TextOverflow.ellipsis,),
                    Text(DateFormat("dd MMMM yyyy","id_ID").format(DateTime.now()), style: greyFontStyle, overflow: TextOverflow.ellipsis, textAlign: TextAlign.end,),
                  ],
                ),
              ],
            ),
            widgetChild,
          ],
        ),
      ),
    );
  }
}
