import "package:flutter/material.dart";
import 'package:warnet_topup/currency.dart';
import 'package:warnet_topup/models/games_model.dart';
import 'package:warnet_topup/theme.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage(
    this.player_id,
    this.zona_id,
    this.servers,
    this.nominal,
    this.price,
    this.game, {
    super.key,
  });
  final String player_id;
  final String zona_id;
  final String? servers;
  final String nominal;
  final int price;
  final GamesModel game;

  AppBar header() {
    return AppBar(
      backgroundColor: bgColor_1,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Checkout",
        style: primaryTextStyle.copyWith(
          fontSize: 18,
        ),
      ),
    );
  }

  Widget playerID() {
    return Row(
      children: [
        Image.asset(
          'assets/username_icon.png',
          width: 30,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Player ID",
              style: subtitleTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${player_id}",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget defaultSpaceDetail() {
    return SizedBox(
      height: 20,
    );
  }

  Widget zonaID() {
    return Row(
      children: [
        Icon(
          Icons.place,
          color: primaryColor,
          size: 30,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Zone ID",
              style: subtitleTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${zona_id}",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget serverloc() {
    return Row(
      children: [
        Icon(
          Icons.cast_connected,
          color: primaryColor,
          size: 30,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Server Loc",
              style: subtitleTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${servers}",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget nominal_topup() {
    return Row(
      children: [
        Icon(
          Icons.attach_money,
          color: primaryColor,
          size: 30,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nominal",
              style: subtitleTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${nominal}",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget detailPlayer() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 30,
      ),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor_4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Detail Player",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semibold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          playerID(),
          (zona_id != "")
              ? Column(
                  children: [defaultSpaceDetail(), zonaID()],
                )
              : Container(),
          (servers != null)
              ? Column(
                  children: [defaultSpaceDetail(), serverloc()],
                )
              : Container(),
          defaultSpaceDetail(),
          nominal_topup(),
        ],
      ),
    );
  }

  Widget checkoutSummary() {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor_4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Summary",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semibold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TopUp Price",
                style: secondaryTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              Text(
                "${CurrencyFormat.convertToIdr(price, 0)}",
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Admin",
                style: secondaryTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              Text(
                "2.000",
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 0.5,
            color: secondaryColor,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: priceTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              Text(
                "${CurrencyFormat.convertToIdr(price + 2000, 0)}",
                style: priceTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget checkoutButton(context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 30,
        bottom: 30,
      ),
      child: TextButton(
        child: Text(
          "Checkout Now",
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/checkout-success', (route) => false);
        },
      ),
    );
  }

  Widget content(context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      children: [
        detailPlayer(),
        checkoutSummary(),
        checkoutButton(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor_3,
      appBar: header(),
      body: content(context),
    );
  }
}
