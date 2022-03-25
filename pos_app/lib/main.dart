import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pos_app/category_part/category1.dart';
import 'package:pos_app/view/cart_screen.dart';
import 'package:pos_app/view/shopping_page.dart';
import 'apetizer/apetizer_product.dart';
import 'controller/cart_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final cartController = Get.put(CartController());
  var isDark = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return GetMaterialApp(
      // initialRoute: "/",
      // getPages: [
      //   GetPage(name: "/", page: () => MyApp()),
      //   GetPage(name: "/shopping_cart", page: () => ShoppingPage()),
      //   GetPage(name: "/cart_screen", page: () => CartScreen()),
      // ],
      debugShowCheckedModeBanner: false,
      title: 'Point of Sale',

      theme: ThemeData(
        primaryColor: Colors.teal,
        brightness: Brightness.light,
      ),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.teal.shade100,
          appBar: AppBar(
            backgroundColor: Colors.teal.shade100,
            actions: <Widget>[
              // GetBuilder<CartController>(
              //   builder: (_) => Switch(
              //       value: cartController.isDark,
              //       onChanged: (state) {
              //         print("prntig $state");
              //         cartController.changeTheme(state);
              //       }),
              // ),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.teal.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => CartScreen());
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  label: GetX<CartController>(builder: (controller) {
                    return Text(
                      controller.count.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    );
                  }),
                ),
              ),
            ],
            shadowColor: Colors.black,
            elevation: 5,
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.orange, Colors.redAccent]),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.redAccent,
                      width: 1,
                    ),
                    color: Colors.white),
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                unselectedLabelStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                tabs: [
                  Tab(
                    child: Text("Main Course"),
                  ),
                  Tab(
                    child: Text("Appetizer"),
                  ),
                  Tab(
                    child: Text("Drink"),
                  ),
                  Tab(
                    child: Text("Vorspeisen"),
                  ),
                  Tab(
                    child: Text("Hauptegericht"),
                  ),
                ]),
            // title: const Text(
            //   'POS Restaurant',
            //   style: TextStyle(color: Colors.black, fontSize: 25),
            // ),
          ),
          drawer: Drawer(),
          body: TabBarView(
            children: [
              ShoppingPage(),
              ApetizerProduct(),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
          bottomNavigationBar: _createBottomNavigationBar(),
        ),
      ),
    );
  }

  Widget _createBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal.shade100, Colors.teal.shade100],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          stops: [0.0, 0.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: BottomNavigationBar(
        // currentIndex: 0,
        // onTap: (index) {},
        showUnselectedLabels: true,
        backgroundColor: Colors.teal.shade100,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        unselectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(color: Colors.black),
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.home)),
            title: Text(
              "Home",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Get.to(() => CartScreen());
                },
                child: Icon(Icons.shopping_cart_outlined)),
            title: Text(
              "Cart",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Get.to(() => Category1());
              },
              child: Icon(Icons.store),
            ),
            title: Text(
              "My Store",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
