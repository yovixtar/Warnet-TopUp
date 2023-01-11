import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warnet_topup/models/games_model.dart';
import 'package:warnet_topup/models/nominal_model.dart';
import 'package:warnet_topup/models/servers_model.dart';
import 'package:warnet_topup/pages/product_detail_page.dart';
import 'package:warnet_topup/providers/nominal_provider.dart';
import 'package:warnet_topup/providers/servers_provider.dart';
import 'package:warnet_topup/theme.dart';

class GameTile extends StatefulWidget {
  const GameTile(this.game, {super.key});
  final GamesModel game;

  @override
  State<GameTile> createState() => _GameTileState();
}

class _GameTileState extends State<GameTile> {
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
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://project.kuliah.iyabos.com/topup-v1/images/games/${widget.game.image}',
                width: 155,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.game.category_name}",
                    style: subtitleTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${widget.game.name}",
                    style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semibold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
