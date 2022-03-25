import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/controller/cart_controller.dart';
import 'package:pos_app/controller/shopping_controller.dart';


class CartScreen extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        title: Text("Cart"),
        centerTitle: true,
        shadowColor: Colors.red,
      ),
      backgroundColor: Colors.teal.shade100,
      body: SafeArea(
        child: Column(children: [
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                      Text("\$${controller.products[i].price}"),
                                      Text(
                                          "${controller.products[i].description}"),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          cartController.removeToCart(
                                              controller.products[i]);
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      cartController
                                          .removeToCart(controller.products[i]);
                                    },
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.remove_circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  Text(''),
                                  InkWell(
                                    onTap: () {
                                      cartController
                                          .addToCart(controller.products[i]);
                                    },
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: Colors.green,
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
          Container(
            margin: EdgeInsets.all(10),
            height: 58,
            width: double.infinity,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Get.to(() => Home());
                },
                icon: Icon(Icons.shopping_cart),
                label: GetX<CartController>(builder: (controller) {
                  return Text(
                    ' Total: \$${controller.subtotal}',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  );
                })),
          ),
        ]),
      ),
    );
  }
}
