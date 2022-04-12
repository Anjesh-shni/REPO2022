import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.green.shade300,
      child: Container(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cartsavedata");
              },
              icon: Icon(Icons.archive),
            ),
            Center(
              child: Badge(
                animationType: BadgeAnimationType.fade,
                toAnimate: true,
                badgeColor: Colors.red,
                badgeContent: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/cart");
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/userpfofiles");
              },
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
