import 'package:flutter/material.dart';
import 'package:play/constant/dimension.dart';

class Product1 extends StatelessWidget {
  const Product1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        height: Dimen.screenHeight,
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (c, i) {
              return Container(
                padding: EdgeInsets.only(left: 10, bottom: 5, top: 5),
                margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        offset: Offset(0, 5),
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "product name",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withAlpha(500),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "\$${12}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // Text("spicy"),
                        // SizedBox(
                        //   height: 5,
                        // ),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              //  controller.setQuantity(false);
                            },
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: Dimen.width20,
                          ),
                          Text("1"),
                          //    BigText(
                          //  text: "\$${product.price!} x ${controller.inCartItem}",
                          //  color: ApClrs.mainBlackClr,
                          //  ),
                          SizedBox(
                            width: Dimen.width20,
                          ),
                          GestureDetector(
                            onTap: () {
                              //  controller.setQuantity(true);
                            },
                            child: Icon(
                              Icons.add_circle,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
