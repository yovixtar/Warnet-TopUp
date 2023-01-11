import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warnet_topup/models/games_model.dart';
import 'package:warnet_topup/models/nominal_model.dart';
import 'package:warnet_topup/models/servers_model.dart';
import 'package:warnet_topup/providers/nominal_provider.dart';
import 'package:warnet_topup/theme.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail(this.game, this.nominal, this.servers, {super.key});

  final GamesModel game;
  final List<NominalModel> nominal;
  final List<ServersModel> servers;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  // final items = [
  //   {'id': 1, 'name': 'a'},
  //   {'id': 2, 'name': 'b'},
  //   {'id': 3, 'name': 'c'},
  // ];
  String? valueNominalName;
  String? valueServerName;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.shopping_bag,
                    color: bgColor_1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "${widget.game.name}",
            style: primaryTextStyle.copyWith(fontSize: 30),
          ),
        ],
      );
    }

    Widget idEmailInput() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Player ID",
              style: TextStyle(
                color: primaryText,
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: bgColor_2,
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/username_icon.png',
                    width: 17,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: "FreeFire Player ID",
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget zonaInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Zone ID",
              style: TextStyle(
                color: primaryText,
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: bgColor_2,
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.place,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: "Player's Zone ID",
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget ServerInput() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pilih Server",
                  style: TextStyle(
                    color: primaryText,
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 45,
                    right: 20,
                    top: 5,
                    bottom: 5,
                  ),
                  decoration: BoxDecoration(
                      color: bgColor_2,
                      borderRadius: BorderRadius.circular(10)),

                  // dropdown below..
                  child: DropdownButton(
                    value: valueServerName,
                    onChanged: (String? newValue) => setState(() {
                      valueServerName = newValue!;
                    }),
                    items: widget.servers.map(
                      (item) {
                        return DropdownMenuItem(
                          value: item.name,
                          child: Text(
                            item.name.toString(),
                            style: TextStyle(
                              color: priceColor,
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        );
                      },
                    ).toList(),

                    // add extra sugar..
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 42,
                    underline: SizedBox(),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }

    Widget CurrencyInput() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nominal Topup",
                  style: TextStyle(
                    color: primaryText,
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 45,
                    right: 20,
                    top: 5,
                    bottom: 5,
                  ),
                  decoration: BoxDecoration(
                      color: bgColor_2,
                      borderRadius: BorderRadius.circular(10)),

                  // dropdown below..
                  child: DropdownButton(
                    value: valueNominalName,
                    onChanged: (String? newValue) => setState(() {
                      valueNominalName = newValue!;
                    }),
                    items: widget.nominal.map(
                      (item) {
                        return DropdownMenuItem(
                          value: item.name,
                          child: Text(
                            item.name.toString(),
                            style: TextStyle(
                              color: priceColor,
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        );
                      },
                    ).toList(),

                    // add extra sugar..
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 42,
                    underline: SizedBox(),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }

    Widget submitButton() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 40,
          ),
          child: TextButton(
            child: Text(
              "Top Up",
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
              Navigator.pushNamed(context, '/checkout');
            },
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
            bottom: Radius.circular(24),
          ),
          color: bgColor_1,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Top Up ${widget.game.name}",
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semibold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${widget.game.category_name}",
                          style: subtitleTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/wishlist_icon.png',
                    width: 46,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              decoration: BoxDecoration(
                color: bgColor_2,
                borderRadius: BorderRadius.circular(4),
              ),
              padding: EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saldo Anda :",
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Rp 50.000",
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 40,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                children: [
                  (widget.game.player_id == "true")
                      ? idEmailInput()
                      : Container(),
                  (widget.game.zone_id == "true") ? zonaInput() : Container(),
                  (widget.game.servers == "true") ? ServerInput() : Container(),
                  CurrencyInput(),
                  submitButton(),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(
        children: [
          header(),
          content(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
