import 'package:flutter/material.dart';
import 'package:hotel_lemon/widget/bottom_nav_bar.dart';
import 'package:hotel_lemon/widget/custom_app_bar.dart';

class UserProfiles extends StatelessWidget {
  const UserProfiles({Key? key}) : super(key: key);

  static const String routeName = "/userpfofiles";
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => UserProfiles(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: CustomAppBAr(title: "Profiles"),
      bottomNavigationBar: CustomNavBar(),
      body: Container(
        child: Center(
          child: Text(
            "No User Profiles Available",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
