import 'package:flutter/material.dart';
import 'package:warnet_topup/theme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 50,
          left: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: TextStyle(
                color: primaryText,
                fontSize: 24,
                fontWeight: semibold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Sign In to Confirm",
              style: TextStyle(
                color: subtitleText,
                fontSize: 15,
              ),
            )
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 70,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
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
                        hintText: "Your Username",
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

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
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
                    'assets/password_icon.png',
                    width: 17,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: primaryTextStyle,
                      obscureText: true,
                      decoration: InputDecoration.collapsed(
                        hintText: "Your Password",
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

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 40,
        ),
        child: TextButton(
          child: Text(
            "Sign  In",
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
            Navigator.pushNamed(context, '/home');
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor_1,
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            usernameInput(),
            passwordInput(),
            signInButton(),
          ],
        ),
      ),
    );
  }
}
