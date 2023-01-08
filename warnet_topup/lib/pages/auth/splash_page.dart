import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warnet_topup/providers/games_provider.dart';
import 'package:warnet_topup/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getInit();
  }

  getInit() async {
    await Provider.of<GamesProvider>(context, listen: false).getGames();
    Navigator.pushNamed(
      context,
      '/sign-in',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor_1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/logo_splash.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
