import 'package:flutter/material.dart';
import 'package:tpq1/theme.dart';

class SantriBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  SantriBottomNav({this.selectedIndex = 0, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget menuItem(int index, String label, String image) {
      return GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(image, width: 25, height: 25, color: selectedIndex == index ? primaryColor : secondaryColor,),
            ),
            Container(
              padding: EdgeInsets.only(top: 2.5),
              child: Text(
                label,
                style: (selectedIndex == index) ? primaryFontStyle.copyWith(fontSize: 9, fontWeight: FontWeight.w500): greyFontStyle.copyWith(fontSize: 9, fontWeight: FontWeight.w200),
              ),
            )
          ],
        ),
      );
    }

    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          menuItem(0, "BERANDA", "assets/home-black.png",),
          menuItem(1, "PRESENSI", "assets/scorecard-black.png",),
          menuItem(2, "INFO", "assets/commercial-black.png",),
          menuItem(3, "SPP", "assets/note-red.png",),
          menuItem(4, "PROFIL", "assets/user-black.png",),
        ],
      ),
    );
  }
}
