import 'package:flutter/material.dart';
import 'package:hotel_lemon/screen/screen_barrel.dart';
import 'package:hotel_lemon/widget/custom_app_bar.dart';
import 'package:hotel_lemon/widget/widget_barrel_file.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/";
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBAr(
        title: "Hotel Lemon",
      ),
      bottomNavigationBar: CustomNavBar(),
      body: Column(
        children: [
          Container(
            height: 30,
            width: double.infinity,
            color: Colors.green.shade300,
            child: Center(
              child: Text(
                "List of table",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            color: Colors.green.shade100,
            height: h - 191,
            child: GridView.builder(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 5,
                  top: 10,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  int initial = index + 1;
                  return InkWell(
                    onTap: () {
                      var tableNo = initial;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TablePage(
                            initial: tableNo,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      margin: EdgeInsets.only(bottom: 10, right: 10, left: 5),
                      decoration: BoxDecoration(
                        color: index.isEven
                            ? Colors.green.shade100
                            : Colors.green.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5.0,
                            offset: Offset(0, 5),
                          ),
                          BoxShadow(
                            color: Colors.green,
                            offset: Offset(-5, 0),
                          ),
                          BoxShadow(
                            color: Colors.green,
                            offset: Offset(5, 0),
                          ),
                        ],
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Table No: $initial",
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
