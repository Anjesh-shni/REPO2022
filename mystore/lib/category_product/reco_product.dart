import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mystore/controllers/cart_controller.dart';
import 'package:mystore/controllers/popular_product_controller.dart';
import 'package:mystore/controllers/recommended_product_controller.dart';
import 'package:mystore/models/category_model.dart';
import 'package:mystore/routes/routes_helper.dart';
import 'package:mystore/utils/dimension.dart';
import 'package:mystore/widget/app_icon.dart';
import 'package:mystore/widget/bigtext.dart';
import 'package:mystore/widget/colors.dart';

class RecoCategoryList extends StatelessWidget {
  final int pageId;
  final String page;
  const RecoCategoryList({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text(
          "Sub-category",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
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
      body: GetBuilder<PopularProductController>(builder: (controller) {
        return Container(
          width: double.maxFinite,
          height: Dimen.screenHeight,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.popularProductList.length,
              itemBuilder: (c, index) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 5),
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
                      Expanded(
                        child: Row(
                          children: [
                            // ClipRect(
                            //   child: Image.asset(
                            //     "assets/image/a.jpg",
                            //     fit: BoxFit.cover,
                            //     height: 90,
                            //     width: 90,
                            //   ),
                            // ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: controller
                                      .popularProductList[index].name!,
                                  size: 18,
                                ),
                                Text(
                                  "spicy",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                Text(
                                  "\$${controller.popularProductList[index].price!}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                                controller.setQuantity(false);
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: Dimen.width5,
                            ),
                            // Text("1"),
                            BigText(text: controller.inCartItem.toString()),
                            SizedBox(
                              width: Dimen.width5,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setQuantity(true);
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
        );
      }),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (controller) {
        return Container(
            height: Dimen.bottomNav - 20,
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
            padding: EdgeInsets.only(
                top: Dimen.height10,
                bottom: Dimen.height10,
                right: Dimen.width15,
                left: Dimen.width20),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10
                  // topLeft: Radius.circular(Dimen.radius20 * 2),
                  // topRight: Radius.circular(Dimen.radius20 * 2),
                  ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimen.height20,
                      bottom: Dimen.height15,
                      left: Dimen.width20,
                      right: Dimen.width20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimen.radius20),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: ApClrs.signClr,
                        ),
                      ),
                      SizedBox(
                        width: Dimen.width5,
                      ),
                      BigText(text: controller.inCartItem.toString()),
                      SizedBox(
                        width: Dimen.width5,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: ApClrs.signClr,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.addItem(product);
                    Get.snackbar(
                      "Cart Info",
                      "Product added",
                      backgroundColor: ApClrs.mainClr,
                      colorText: Colors.black,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimen.height20,
                        bottom: Dimen.height15,
                        left: Dimen.width20,
                        right: Dimen.width20),
                    child: BigText(
                      text: "\$${product.price!}|Add to Cart",
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      color: ApClrs.mainClr,
                      borderRadius: BorderRadius.circular(Dimen.radius20),
                    ),
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
