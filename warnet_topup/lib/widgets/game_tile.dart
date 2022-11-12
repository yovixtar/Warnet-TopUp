import 'package:flutter/material.dart';
import 'package:warnet_topup/theme.dart';

class GameTile extends StatelessWidget {
  const GameTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              'assets/games/freefire.png',
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
                  "Game FPS",
                  style: subtitleTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Free Fire",
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
    );
  }
}
