import 'package:badges/badges.dart';
import 'package:cource/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:cource/screens/categories.dart';
import 'package:cource/screens/home_screen.dart';
import 'package:cource/screens/user.dart';
import 'package:cource/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/cusom_app_bar.dart';
import 'cart/cart_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {
      'page': const HomeScreen(),
      'title': 'Home Screen',
    },
    {
      'page': WishlistScreen(),
      'title': 'Wishlist Screenn',
    },
    {
      'page': const CartScreen(),
      'title': 'Cart Screen',
    },
    {
      'page': const UserScreen(),
      'title': 'user Screen',
    },
  ];


  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    bool _isDark = themeState.getDarkTheme;
    return SafeArea(
      child: Scaffold(


        // appBar: AppBar(
        //   title: Text( _pages[_selectedIndex]['title']),
        // ),
        body: _pages[_selectedIndex]['page'],
        bottomNavigationBar: Container(
        height: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
      topRight: Radius.circular(40)),
      child:BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          iconSize: 20.0,
          selectedIconTheme: IconThemeData(size: 28.0),
          selectedItemColor: Color(0xff4CAD73),
          unselectedItemColor: Colors.black,
          selectedFontSize: 16.0,
          unselectedFontSize: 12,
          currentIndex: _selectedIndex,
      onTap: (val) => setState(() {
      _selectedIndex = val;}),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1
                  ? IconlyBold.heart
                  : IconlyLight.heart,),
              label: "Wishlist",
            ),
            BottomNavigationBarItem(
              icon: Consumer<CartProvider>(builder: (context, myCart, child) {
                return Badge(
                    position: BadgePosition.topEnd(top: -7, end: -7),
                    badgeContent:
                         TextWidget(
                            text: myCart.getCartItems.length.toString(),
                            color: Colors.white,
                            textSize: 15),
                    child: Icon(
                        _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),);
              }),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
              label: "User",
            ),
          ],
        ),
      ))),
    );
  }
}
