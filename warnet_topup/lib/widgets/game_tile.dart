import 'package:flutter/material.dart';
import 'package:warnet_topup/models/games_model.dart';
import 'package:warnet_topup/theme.dart';

class GameTile extends StatefulWidget {
  const GameTile(this.game, {super.key});
  final GamesModel game;

  @override
  State<GameTile> createState() => _GameTileState();
}

class _GameTileState extends State<GameTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product-detail');
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
              child: Image.asset(
                'assets/games/${widget.game.image}',
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
