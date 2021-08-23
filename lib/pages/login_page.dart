import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tpq1/pages/general_page.dart';
import 'package:tpq1/providers/auth_provider.dart';
import 'package:tpq1/providers/santri_provider.dart';
import 'package:tpq1/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    message(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        backgroundColor: primaryColor,
      ));
    }

    handleLogin() async {
      setState(() {isLoading = true;});
      if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
        if (await authProvider.login(
            username: usernameController.text,
            password: passwordController.text)) {
          try {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('rememberme', jsonEncode(authProvider.user));
            print(prefs.getString('rememberme'));
            if (authProvider.user.role == 'Pengajar') {
              await Provider.of<SantriProvider>(context, listen: false).getAllSantri(token: authProvider.user.token);
              Navigator.pushReplacementNamed(context, '/pengajar/main');
            } else {
              Navigator.pushReplacementNamed(context, '/santri/main');
            }
          } catch (e) {
            print(e);
          }
        } else {
          message('Gagal masuk!');
        }
      } else {
        message('Nama Pengguna dan Kata Sandi tidak boleh kosong!');
      }
      setState(() {isLoading = false;});
    }

    Widget inputField(String text, TextEditingController controller, bool password) {
      return Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(text, style: blackFontStyle2),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              obscureText: password,
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Masukkan $text' ),
            ),
          ),
        ],
      );
    }

    Widget loginButton() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 24),
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: TextButton(
          onPressed: () {
            handleLogin();
          },
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: primaryColor),
          child: isLoading? lightLoadingIndicator2 : Text('Masuk', style: whiteFontStyle3.copyWith(),),
        ),
      );
    }

    Widget loginPage() {
      return Column(
        children: [
          inputField("Nama Pengguna", usernameController, false),
          inputField("Kata Sandi", passwordController, true),
          loginButton(),
        ],
      );
    }
    return GeneralPage(child: loginPage(), title: "Log Masuk", subtitle: "Bismillahirrahmanirrahim",);
  }
}
