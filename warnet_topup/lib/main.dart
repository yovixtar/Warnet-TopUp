import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:warnet_topup/pages/order/checkout_page.dart';
import 'package:warnet_topup/pages/home/main_page.dart';
import 'package:warnet_topup/pages/order/order_page.dart';
import 'package:warnet_topup/pages/order/success_checkout.dart';
import 'package:warnet_topup/pages/product_detail_page.dart';
import 'package:warnet_topup/pages/auth/sign_in_page.dart';
import 'package:warnet_topup/pages/auth/splash_page.dart';
import 'package:warnet_topup/providers/auth_provider.dart';
import 'package:warnet_topup/providers/categories_provider.dart';
import 'package:warnet_topup/providers/games_provider.dart';
import 'package:warnet_topup/providers/nominal_provider.dart';
import 'package:warnet_topup/providers/servers_provider.dart';
// import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GamesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NominalProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ServersProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/home': (context) => MainPage(),
          '/orders': (context) => OrderPage(),
          '/checkout': ((context) => CheckoutPage()),
          '/checkout-success': ((context) => CheckoutSuccessPage()),
        },
      ),
    );
  }
}
