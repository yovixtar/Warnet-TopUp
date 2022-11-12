import 'package:flutter/material.dart';
import 'package:warnet_topup/pages/home/chat_page.dart';
import 'package:warnet_topup/pages/home/favorite_page.dart';
import 'package:warnet_topup/pages/home/home_page.dart';
import 'package:warnet_topup/pages/home/profile_page.dart';
import 'package:warnet_topup/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/orders');
        },
        child: Image.asset(
          'assets/cart_icon.png',
          width: 25,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 20,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: bgColor_4,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/home_icon.png',
                    width: 20,
                    color: currentIndex == 0 ? primaryColor : thirdColor,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/chat_icon.png',
                    width: 20,
                    color: currentIndex == 1 ? primaryColor : thirdColor,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/transparent.png',
                    width: 20,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/favorite_icon.png',
                    width: 20,
                    color: currentIndex == 3 ? primaryColor : thirdColor,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/profile_icon.png',
                    width: 18,
                    color: currentIndex == 4 ? primaryColor : thirdColor,
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 3:
          return FavoritePage();
          break;
        case 4:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
        backgroundColor: currentIndex == 0 ? bgColor_1 : bgColor_3,
        floatingActionButton: cartButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customBottomNav(),
        body: body());
  }
}
