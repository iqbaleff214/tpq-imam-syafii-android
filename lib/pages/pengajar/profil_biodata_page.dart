import 'package:flutter/material.dart';
import 'package:tpq1/theme.dart';

class ProfilBiodataPage extends StatelessWidget {
  const ProfilBiodataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppBar header() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Biodata', style: blackFontStyle1,),
        leading: IconButton(icon: Icon(Icons.close, color: Colors.black87,), onPressed: () { Navigator.pop(context); },),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.check, color: Colors.black87,))
        ],
      );
    }

    Widget input(String label, String placeholder) {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: secondaryFontStyle.copyWith(fontSize: 13),),
            TextFormField(
              style: primaryFontStyle,
              decoration: InputDecoration(
                  hintText: placeholder,
                  hintStyle: blackFontStyle3,
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: secondaryColor))
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        child: Column(
          children: [
            input('Nama Lengkap', 'M. Iqbal Effendi'),
            input('Tempat Lahir', 'Martapura'),
            input('Tanggal Lahir', '21/04/2000'),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightColor,
      appBar: header(),
      body: content(),
    );
  }
}
