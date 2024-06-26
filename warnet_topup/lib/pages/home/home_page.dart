// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warnet_topup/models/games_model.dart';
import 'package:warnet_topup/models/users_model.dart';
import 'package:warnet_topup/providers/auth_provider.dart';
import 'package:warnet_topup/providers/games_provider.dart';
import 'package:warnet_topup/theme.dart';
import 'package:warnet_topup/widgets/game_card.dart';
import 'package:warnet_topup/widgets/game_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    GamesProvider gamesProvider = Provider.of<GamesProvider>(context);
    UsersModel user = authProvider.user;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, ${user.fullname}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '@${user.username}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://project.kuliah.iyabos.com/topup-v1/images/${user.image!}",
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor,
                ),
                child: Text(
                  'All Game',
                  style: primaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: transparanColor,
                    border: Border.all(
                      color: subtitleText,
                    )),
                child: Text(
                  'Game FPS',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: transparanColor,
                    border: Border.all(
                      color: subtitleText,
                    )),
                child: Text(
                  'Game MOBA',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: transparanColor,
                    border: Border.all(
                      color: subtitleText,
                    )),
                child: Text(
                  'Game Desktop',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: transparanColor,
                    border: Border.all(
                      color: subtitleText,
                    )),
                child: Text(
                  'Game RPG',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: transparanColor,
                    border: Border.all(
                      color: subtitleText,
                    )),
                child: Text(
                  'Voucher Games',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: transparanColor,
                    border: Border.all(
                      color: subtitleText,
                    )),
                child: Text(
                  'Entertainment',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularGameTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Text(
          'Popular Games',
          style: primaryTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget popularGameBox() {
      return Container(
        margin: EdgeInsets.only(
          top: 15,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children:
                    gamesProvider.games.map((game) => GameCard(game)).toList(),
              )
            ],
          ),
        ),
      );
    }

    Widget AllGameTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Text(
          'All Games',
          style: primaryTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget allGameArea() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: gamesProvider.games.map((game) => GameTile(game)).toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularGameTitle(),
        popularGameBox(),
        AllGameTitle(),
        allGameArea(),
      ],
    );
  }
}
