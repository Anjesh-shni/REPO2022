import 'package:brocklyn_cafe/cart/cart_history_page.dart';
import 'package:brocklyn_cafe/cart/cart_page.dart';
import 'package:brocklyn_cafe/pages/account/account_page.dart';
import 'package:brocklyn_cafe/pages/home/mian_page.dart';
import 'package:brocklyn_cafe/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    MainPage(),
<<<<<<< HEAD
    CartHistory(),
    CartPage(),

    // CartHistory(),
    AccountPage(),
=======
    Container(
      child: Center(child: Text("welcome")),
    ),
    Container(),
        
        // CartHistory(),
        AccountPage(),
>>>>>>> parent of 4fe81b25 (today)
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        selectedItemColor: ApClrs.mainClr,
        unselectedItemColor: Colors.blueGrey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12.0,
        unselectedFontSize: 10.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            title: Text("History"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Cart"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profiles"),
          ),
        ],
      ),
    );
  }
}
