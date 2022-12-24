import 'package:flutter/material.dart';
import 'package:warnet_topup/theme.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: bgColor_4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/success_icon.png',
                width: 20,
                color: successColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "24 Desember 2022",
                style:
                    primaryTextStyle.copyWith(fontWeight: light, fontSize: 12),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/games/freefire.png',
                    ),
                  ),
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
                      "FF 50 Diamond",
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rp 9.000",
                      style: priceTextStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
