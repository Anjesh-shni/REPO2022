import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hotel_lemon/model/model_barrel.dart';
import 'package:hotel_lemon/screen/screen_barrel.dart';
import 'package:hotel_lemon/widget/bottom_nav_bar.dart';

class TablePage extends StatefulWidget {
  final int initial;
  const TablePage({
    Key? key,
    required this.initial,
  }) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  bool _isElevated = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green.shade300,
        title: Text(
          "Hotel Lemon",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 50),
                child: Text(
                  "Table No: ${widget.initial}",
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isElevated = !_isElevated;
                      Navigator.pushNamed(context, "/cart");
                    });
                  },
                  child: AnimatedContainer(
                    margin: EdgeInsets.only(right: 10),
                    duration: Duration(milliseconds: 200),
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: _isElevated
                            ? [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(4, 4),
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                ),
                                BoxShadow(
                                  color: Colors.green.shade700,
                                  offset: Offset(-4, -4),
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                ),
                              ]
                            : null),
                    child: Center(
                      child: Badge(
                        animationType: BadgeAnimationType.fade,
                        toAnimate: false,
                        badgeColor: Colors.red,
                        badgeContent: Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Carasoul(
          products: Product.products[0],
        ),
        // child: CategoryColumn(c),
      ),
    );
  }
}
