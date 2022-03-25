import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/controller/cart_controller.dart';
import 'package:pos_app/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (c, i) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Card(
                          color: Colors.teal.shade50,
                          margin: EdgeInsets.all(5),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.products[i].productName}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            "\$${controller.products[i].price}"),
                                        Text(
                                            "${controller.products[i].description}"),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        cartController
                                            .addToCart(controller.products[i]);

                                        Get.snackbar("", "",
                                            titleText: Text("Product Added"),
                                            messageText: Text(
                                              " ${controller.products[i].productName} has been added in your cart",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            snackPosition: SnackPosition.TOP,
                                            borderRadius: 8,
                                            animationDuration:
                                                Duration(milliseconds: 900),
                                            borderColor: Colors.red,
                                            borderWidth: 1,
                                            backgroundColor: Colors.white,
                                            isDismissible: true,
                                            dismissDirection:
                                                SnackDismissDirection
                                                    .HORIZONTAL,
                                            backgroundGradient: LinearGradient(
                                                colors: [
                                                  Colors.orange,
                                                  Colors.teal
                                                ]),
                                            duration: Duration(seconds: 1));
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.teal,
                                            Colors.redAccent
                                          ]),
                                          color: Colors.green,
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Colors.redAccent,
                                            width: 1,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }),
            ),
            // GetX<CartController>(builder: (controller) {
            //   return Text(
            //     ' Total: \$ ${controller.subtotal}',
            //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            //   );
            // }),
            // SizedBox(
            //   height: 50,
            // ),
          ],
        ),
      ),
    );
  }
}
