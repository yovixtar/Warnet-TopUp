import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warnet_topup/models/games_model.dart';
import 'package:warnet_topup/models/nominal_model.dart';
import 'package:warnet_topup/models/servers_model.dart';
import 'package:warnet_topup/pages/product_detail_page.dart';
import 'package:warnet_topup/providers/categories_provider.dart';
import 'package:warnet_topup/providers/nominal_provider.dart';
import 'package:warnet_topup/providers/servers_provider.dart';
import 'package:warnet_topup/theme.dart';

import '../models/categories_model.dart';

class GameCard extends StatefulWidget {
  const GameCard(this.game, {super.key});

  final GamesModel game;

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  // GameCard(this.game);
  toDetail() async {
    await Provider.of<NominalProvider>(context, listen: false)
        .getNominalByGameID(widget.game.id!);

    await Provider.of<ServersProvider>(context, listen: false)
        .getServersByGameID(widget.game.id!);

    NominalProvider nominalProvider =
        Provider.of<NominalProvider>(context, listen: false);
    List<NominalModel> nominal = nominalProvider.nominal;

    ServersProvider serversProvider =
        Provider.of<ServersProvider>(context, listen: false);
    List<ServersModel> servers = serversProvider.servers;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetail(widget.game, nominal, servers),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toDetail();
      },
      child: Container(
        width: 215,
        height: 200,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: subtitleText,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Image.network(
              "https://project.kuliah.iyabos.com/topup-v1/images/games/${widget.game.image}",
              width: 215,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.game.category_name}",
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${widget.game.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
