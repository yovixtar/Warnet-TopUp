import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warnet_topup/pages/home/main_page.dart';
import 'package:warnet_topup/pages/order_page.dart';
import 'package:warnet_topup/pages/product_detail_page.dart';
import 'package:warnet_topup/pages/sign_in_page.dart';
import 'package:warnet_topup/pages/splash_page.dart';
// import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/home': (context) => MainPage(),
        '/orders': (context) => OrderPage(),
        '/product-detail': ((context) => ProductDetail()),
      },
    );
  }
}
