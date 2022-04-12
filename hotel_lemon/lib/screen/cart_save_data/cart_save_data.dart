import 'package:flutter/material.dart';
import 'package:hotel_lemon/widget/bottom_nav_bar.dart';
import 'package:hotel_lemon/widget/custom_app_bar.dart';

class CartSaveData extends StatelessWidget {
  const CartSaveData({Key? key}) : super(key: key);

  static const String routeName = "/cartsavedata";
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartSaveData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: CustomAppBAr(title: "History"),
      bottomNavigationBar: CustomNavBar(),
      body: Column(
        children: [
          Container(
            height: 30,
            width: double.infinity,
            color: Colors.green.shade200,
            child: Center(
              child: Text(
                "Cart Summary",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.green.shade100,
            height: h - 191,
            child: ListView.builder(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 5,
                  top: 10,
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  int initial = index + 1;
                  return InkWell(
                    onTap: () {
                      // var tableNo = initial;
                      Navigator.pushNamed(context, "/cart");
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
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
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                margin: EdgeInsets.only(right: 10, top: 10),
                                height: 20,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blueGrey,
                                ),
                                child: Row(
                                  children: [
                                    Text("View "),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Burger",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${12}€",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          // Spacer(),
                          // Container(
                          //   height: 10,
                          //   width: 100,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     color: Colors.blueGrey,
                          //   ),
                          //   child: Expanded(
                          //     child: Row(
                          //       children: [
                          //         Text("see more"),
                          //         IconButton(
                          //             onPressed: () {},
                          //             icon: Icon(
                          //               Icons.arrow_downward,
                          //               color: Colors.blue,
                          //               size: 16,
                          //             )),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          Text(
                            "Total:   ${40}€",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
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
