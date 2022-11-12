import 'package:flutter/material.dart';
import 'package:warnet_topup/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: bgColor_1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/user_avatar.png",
                    width: 64,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Khazim Fikri",
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semibold,
                        ),
                      ),
                      Text(
                        "@khazimstar",
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: Image.asset(
                    "assets/logout.png",
                    width: 25,
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String txt) {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt,
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryText,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: bgColor_1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Account",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
              menuItem("Edit Profile"),
              menuItem("Your Orders"),
              menuItem("Help"),
              SizedBox(
                height: 30,
              ),
              Text(
                "General",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
              menuItem("Privacy & Policy"),
              menuItem("Term of Service"),
              menuItem("Rate App"),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
