import 'package:brocklyn_cafe/controllers/popular_product_controller.dart';
import 'package:brocklyn_cafe/routes/routes_helper.dart';
import 'package:brocklyn_cafe/utils/dimension.dart';
import 'package:brocklyn_cafe/widget/app_icon.dart';
import 'package:brocklyn_cafe/widget/bigtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


class CategoryList extends StatelessWidget {
  CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text(
          "Sub-category",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        // bottom: TabBar(
        //   isScrollable: true,
        //   labelColor: Colors.black,
        //   labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        //   unselectedLabelColor: Colors.grey,
        //   unselectedLabelStyle:
        //       TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        //   tabs: [
        //     Tab(
        //       child: Text("Main Course"),
        //     ),
        //     Tab(
        //       child: Text("Appetizer"),
        //     ),
        //     Tab(
        //       child: Text("Drink"),
        //     ),
        //     Tab(
        //       child: Text("Vorspeisen"),
        //     ),
        //     Tab(
        //       child: Text("Hauptegericht"),
        //     ),
        //     Tab(
        //       child: Text("Desserts"),
        //     ),
        //   ],
        // ),
        // title: const Text(
        //   'Menu',
        //   style: TextStyle(color: Colors.red, fontSize: 30),
        // ),

        actions: [
          GetBuilder<PopularProductController>(builder: (controller) {
            return GestureDetector(
              onTap: () {
                if (controller.totalItems >= 1)
                  Get.toNamed(RouteHelper.getCartPage());
              },
              child: Stack(
                children: [
                  Center(
                    child: AppIcon(
                      backgound: Color(0xff80cbc4),
                      icon: Icons.shopping_cart_outlined,
                      iconColor: Colors.white,
                      iconSize: 25,
                    ),
                  ),
                  controller.totalItems >= 1
                      ? Positioned(
                          right: 0,
                          top: 0,
                          child: AppIcon(
                            icon: Icons.circle,
                            size: 20,
                            iconColor: Colors.transparent,
                            backgound: Colors.amber,
                          ),
                        )
                      : Container(),
                  Get.find<PopularProductController>().totalItems >= 1
                      ? Positioned(
                          right: 4,
                          top: 4,
                          child: BigText(
                            text: Get.find<PopularProductController>()
                                .totalItems
                                .toString(),
                            size: 12,
                            color: Colors.black,
                          ),
                        )
                      : Container(),
                ],
              ),
            );
          }),
        ],
      ),
      body: Container(
        width: double.maxFinite,
        height: Dimen.screenHeight,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 25,
            itemBuilder: (c, i) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(
                  top: Dimen.height15,
                  left: Dimen.width10,
                  right: Dimen.width10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // ClipRect(
                        //   child: Image.asset(
                        //     "assets/image/a.jpg",
                        //     fit: BoxFit.cover,
                        //     height: 90,
                        //     width: 90,
                        //   ),
                        // ),
                        SizedBox(
                          width: Dimen.width10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Indian food",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "spicy",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            Text(
                              "\$${10}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimen.height10,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              //  controller.setQuantity(false);
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
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
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Dimen.width5,
                    ),
                  ],
                ),
              );
            }),
      ),

      // bottomNavigationBar:
      //     GetBuilder<PopularProductController>(builder: (popularProduct) {
      //   return Container(
      //     height: Dimen.bottomNav,
      //     padding: EdgeInsets.only(
      //         top: Dimen.height30,
      //         bottom: Dimen.height30,
      //         right: Dimen.width20,
      //         left: Dimen.width20),
      //     decoration: BoxDecoration(
      //       color: Colors.transparent,
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(Dimen.radius20 * 2),
      //         topRight: Radius.circular(Dimen.radius20 * 2),
      //       ),
      //     ),
      //     child: popularProduct.getItems.length > 0
      //         ? Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Container(
      //                 padding: EdgeInsets.only(
      //                     top: Dimen.height20,
      //                     bottom: Dimen.height20,
      //                     left: Dimen.width20,
      //                     right: Dimen.width20),
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(Dimen.radius20),
      //                 ),
      //                 child: Row(
      //                   children: [
      //                     GestureDetector(
      //                       onTap: () {
      //                         popularProduct.setQuantity(false);
      //                       },
      //                       child: Icon(
      //                         Icons.remove,
      //                         color: ApClrs.signClr,
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: Dimen.width5,
      //                     ),
      //                     BigText(text: popularProduct.inCartItem.toString()),
      //                     SizedBox(
      //                       width: Dimen.width5,
      //                     ),
      //                     GestureDetector(
      //                       onTap: () {
      //                         popularProduct.setQuantity(true);
      //                       },
      //                       child: Icon(
      //                         Icons.add,
      //                         color: ApClrs.signClr,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               GestureDetector(
      //                 onTap: () {
      //                   popularProduct.addItem(product);
      //                   Get.snackbar(
      //                     "Cart Info",
      //                     "Product added",
      //                     backgroundColor: ApClrs.mainClr,
      //                     colorText: Colors.black,
      //                   );
      //                 },
      //                 child: Container(
      //                   padding: EdgeInsets.only(
      //                       top: Dimen.height20,
      //                       bottom: Dimen.height20,
      //                       left: Dimen.width20,
      //                       right: Dimen.width20),
      //                   child: BigText(
      //                     text: "\$${product.price!}|Add to Cart",
      //                     color: Colors.white,
      //                   ),
      //                   decoration: BoxDecoration(
      //                     color: ApClrs.mainClr,
      //                     borderRadius: BorderRadius.circular(Dimen.radius20),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           )
      //         : Container(),
      //   );
      // }),
    );
  }
}
