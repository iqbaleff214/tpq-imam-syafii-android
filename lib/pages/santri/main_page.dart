import 'package:flutter/material.dart';
import 'package:tpq1/pages/pengajar/info_page.dart';
import 'package:tpq1/pages/santri/beranda_page.dart';
import 'package:tpq1/pages/santri/presensi_page.dart';
import 'package:tpq1/pages/santri/profil_page.dart';
import 'package:tpq1/pages/santri/spp_page.dart';
import 'package:tpq1/theme.dart';
import 'package:tpq1/widgets/santri_bottom_nav.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  PageController page = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: primaryColor,
          ),
          SafeArea(child: Container(color: lightColor,)),
          SafeArea(
              child: PageView(
                controller: page,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: [
                  BerandaPage(),
                  PresensiPage(),
                  InfoPage(),
                  SppPage(),
                  ProfilPage(),
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: SantriBottomNav(
              selectedIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
                page.jumpToPage(selectedIndex);
              },
            ),
          ),
        ],
      ),
    );
  }
}
