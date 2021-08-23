import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  var onBackButtonPressed;
  final Widget child;
  final Color backColor;

  GeneralPage(
      {this.title = "Title",
      this.subtitle = "Subtitle",
      this.onBackButtonPressed,
      required this.child,
      this.backColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(child: Container(color: backColor)),
          SafeArea(
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: double.infinity,
                      height: 100,
                      color: Colors.white,
                      child: Row(
                        children: [
                          onBackButtonPressed != null
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    margin: EdgeInsets.only(right: 26),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/back_arrow.png'))),
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(title,
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    maxLines: 2,
                                    overflow: TextOverflow.clip),
                                Text(subtitle,
                                    style: GoogleFonts.poppins(
                                        color: Color(0xff8D92A3),
                                        fontWeight: FontWeight.w300)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: defaultMargin,
                      width: double.infinity,
                      color: Color(0xffFAFAFC),
                    ),
                    child
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
