import 'package:flutter/material.dart';
import 'package:warnet_topup/theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: bgColor_1,
        centerTitle: true,
        title: Text(
          "Chat",
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: bgColor_3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/chat_page_empty.png',
                width: 100,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Coming Soon!!",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "The message feature is not yet available in this application, please contact us via Whatsapp.",
                style: subtitleTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 44,
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: Text(
                      "Whatsapp",
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    )),
              )
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
