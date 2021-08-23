import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

final double defaultMargin = 24;

Color primaryColor = Color(0xffB6003D);
Color secondaryColor = Color(0xff8D92A3);
Color semiLightColor = Color(0xffd4d4d4);
Color lightColor = Color(0xffFAFAFC);

Widget primaryLoadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: primaryColor,
);
Widget lightLoadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: lightColor,
);

Widget primaryLoadingIndicator2 = CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(primaryColor),);
Widget lightLoadingIndicator2 = CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(lightColor),);

TextStyle maroonFontStyle = GoogleFonts.montserrat(color: primaryColor);

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: secondaryColor);

TextStyle primaryFontStyle = GoogleFonts.poppins(color: primaryColor);
TextStyle secondaryFontStyle = GoogleFonts.poppins(color: secondaryColor);

TextStyle blackFontStyle1 = GoogleFonts.poppins(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins(color: Colors.black);

TextStyle whiteFontStyle1 = GoogleFonts.poppins(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle whiteFontStyle2 = GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle whiteFontStyle3 = GoogleFonts.poppins(color: Colors.white);
