import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tpq1/models/user_model.dart';
import 'package:tpq1/providers/santri_provider.dart';
import 'package:tpq1/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void initState() {
    // checkLogin();
    Timer(Duration(seconds: 2), checkLogin);
    super.initState();
  }

  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String? userlogin = prefs.getString('rememberme');
      if (userlogin != null) {
        var decode = jsonDecode(userlogin);
        UserModel user = UserModel.fromJson(decode);
        if (user.role == 'Pengajar') {
          await Provider.of<SantriProvider>(context, listen: false).getAllSantri(token: user.token);
          Navigator.pushReplacementNamed(context, '/pengajar/main');
        } else {
          Navigator.pushReplacementNamed(context, '/santri/main');
        }
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 195,
              height: 195,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/logo-tpq-02.png'))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                "TPQ",
                style: maroonFontStyle.copyWith(
                    fontSize: 50, fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                "IMAM SYAFI'I",
                style: maroonFontStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              "BANJARMASIN",
              style: maroonFontStyle.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
