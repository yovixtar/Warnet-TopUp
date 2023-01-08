import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 25.0;

Color primaryColor = Color(0xff6C5ECF);
Color secondaryColor = Color(0xff38ABBE);
Color thirdColor = Color(0xff808191);
Color alertColor = Color(0xffED6363);
Color priceColor = Color(0xff2C96F1);
Color bgColor_1 = Color(0xff1F1D2B);
Color bgColor_2 = Color(0xff2B2937);
Color bgColor_3 = Color(0xff242231);
Color bgColor_4 = Color(0xff252836);
Color primaryText = Color(0xffF1F0F2);
Color secondaryText = Color(0xff999999);
Color subtitleText = Color(0xff504F5E);
Color transparanColor = Colors.transparent;
Color blackColor = Color(0xff2E2E2E);
Color successColor = Color(0xff22bb33);

TextStyle primaryTextStyle = TextStyle(
  color: primaryText,
  fontFamily: 'KeepCalm',
);

TextStyle secondaryTextStyle = TextStyle(
  fontFamily: 'KeepCalm',
  color: secondaryText,
);

TextStyle priceTextStyle = TextStyle(
  fontFamily: 'KeepCalm',
  color: priceColor,
);

TextStyle subtitleTextStyle = TextStyle(
  fontFamily: 'KeepCalm',
  color: subtitleText,
);

TextStyle blackTextStyle = TextStyle(
  fontFamily: 'KeepCalm',
  color: blackColor,
);

TextStyle alertTextStyle = TextStyle(
  fontFamily: 'KeepCalm',
  color: alertColor,
);

TextStyle successTextStyle = TextStyle(
  fontFamily: 'KeepCalm',
  color: successColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

void notif(context, String notif, Color? warna) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: warna,
      content: Text(notif),
      duration: Duration(seconds: 5),
    ),
  );
}
