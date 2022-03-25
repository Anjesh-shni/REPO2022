import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play/pages/cart_page.dart';
import 'package:play/pages/product1.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.amber,
                ),
                onPressed: () => {
                  Get.to(CartPage()),
                },
              ),
            ],
            backgroundColor: Colors.blueGrey.shade600,
            bottom: const TabBar(
              
              indicatorColor: Colors.amber,
              isScrollable: true,
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              unselectedLabelColor: Colors.white,
              unselectedLabelStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
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
                Tab(
                  child: Text("Desserts"),
                ),
              ],
            ),
            title: const Text(
              'Categories',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          body: TabBarView(
            dragStartBehavior: DragStartBehavior.start,
            children: [
              Product1(),
              Product1(),
              Product1(),
              Product1(),
              Product1(),
              Product1(),
            ],
          ),
        ),
      ),
    );
  }
}
