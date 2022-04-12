import 'package:brocklyn_cafe/base/empty_cart.dart';
import 'package:brocklyn_cafe/controllers/cart_controller.dart';
import 'package:brocklyn_cafe/controllers/popular_product_controller.dart';
import 'package:brocklyn_cafe/controllers/recommended_product_controller.dart';
import 'package:brocklyn_cafe/routes/routes_helper.dart';
import 'package:brocklyn_cafe/utils/app_constant.dart';
import 'package:brocklyn_cafe/utils/colors.dart';
import 'package:brocklyn_cafe/utils/dimension.dart';
import 'package:brocklyn_cafe/widget/app_icon.dart';
import 'package:brocklyn_cafe/widget/bigtext.dart';
import 'package:brocklyn_cafe/widget/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: "Cart",
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade300,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: Dimen.width20,
            right: Dimen.width20,
            top: Dimen.height30 * 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgound: ApClrs.mainClr,
                    iconSize: Dimen.icon24,
                  ),
                ),
                SizedBox(
                  width: Dimen.width30,
                ),
                GetBuilder<PopularProductController>(
                    builder: (popularProducts) {
                  return Text(
                    "Table No:-",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  );
                }),
                SizedBox(
                  width: Dimen.width20 * 2,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgound: ApClrs.mainClr,
                    iconSize: Dimen.icon24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.white,
                  backgound: ApClrs.mainClr,
                  iconSize: Dimen.icon24,
                )
              ],
            ),
          ),

          /////....................................................../////
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getItems.length > 0
                ? Positioned(
                    top: Dimen.height20 * 5,
                    left: Dimen.width20,
                    right: Dimen.width20,
                    bottom: 0,
                    child: Container(
                      // color: Colors.green,
                      margin: EdgeInsets.only(top: Dimen.height15),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartController>(
                            builder: (cartController) {
                          var _cartList = cartController.getItems;
                          return ListView.builder(
                              itemCount: _cartList.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  height: Dimen.height20 * 5,
                                  width: double.maxFinite,
                                  child: Card(
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            var popularIndex = Get.find<
                                                    PopularProductController>()
                                                .popularProductList
                                                .indexOf(
                                                    _cartList[index].product!);
                                            if (popularIndex >= 0) {
                                              Get.toNamed(
                                                  RouteHelper.getPopularFood(
                                                      // index, "home"
                                                      // popularIndex,
                                                      // "cart-page"
                                                      ));
                                            } else {
                                              var recommendedIndex = Get.find<
                                                      RecommendedProductController>()
                                                  .recommendedProductList
                                                  .indexOf(_cartList[index]
                                                      .product!);

                                              if (recommendedIndex < 0) {
                                                Get.snackbar(
                                                  "History Product",
                                                  "This Product  is Removed from Menu!!!",
                                                  backgroundColor:
                                                      ApClrs.mainClr,
                                                  colorText: Colors.black,
                                                );
                                              } else {
                                                Get.toNamed(RouteHelper
                                                    .getRecommendedFood(
                                                        recommendedIndex,
                                                        "cart-page"));
                                              }
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              bottom: Dimen.height10,
                                            ),
                                            height: Dimen.height20 * 5,
                                            width: Dimen.height20 * 5,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimen.radius20),
                                              color: Colors.white,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    //  AssetImage("assets/image/apet.jpg"),

                                                    NetworkImage(
                                                        AppConstants.BASE_URL +
                                                            AppConstants
                                                                .UPLOAD_URL +
                                                            cartController
                                                                .getItems[index]
                                                                .img!),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimen.width10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            // color: Colors.grey,
                                            height: Dimen.height20 * 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                BigText(
                                                  text: cartController
                                                      .getItems[index].name!,
                                                  color: Colors.black,
                                                ),
                                                SmallTxt(text: "spicy"),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigText(
                                                      text:
                                                          "\$${cartController.getItems[index].price!.toString()}",
                                                      color: Colors.amber,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: Dimen.height10,
                                                          bottom:
                                                              Dimen.height10,
                                                          left: Dimen.width10,
                                                          right: Dimen.width10),
                                                      decoration: BoxDecoration(
                                                        // color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(Dimen
                                                                    .radius20),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              color: ApClrs
                                                                  .signClr,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: Dimen.width5,
                                                          ),
                                                          BigText(
                                                              text: _cartList[
                                                                      index]
                                                                  .quantity
                                                                  .toString()),
                                                          SizedBox(
                                                            width: Dimen.width5,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              color: ApClrs
                                                                  .signClr,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }),
                      ),
                    ),
                  )
                : EmptyCartPage();
          })
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (
        cartController,
      ) {
        return Container(
          height: 65,
          width: double.maxFinite,
          decoration: BoxDecoration(color: Colors.green.shade300, boxShadow: [
            BoxShadow(
              color: Colors.green.shade300,
              offset: Offset(4, 4),
              spreadRadius: 1,
              blurRadius: 15,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              spreadRadius: 1,
              blurRadius: 15,
            ),
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      AppIcon(
                        icon: Icons.shopping_cart_outlined,
                        iconColor: Colors.black,
                        iconSize: 24,
                        backgound: Colors.green.shade300,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      BigText(text: "total \$10"),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  BigText(text: "|Add to cart"),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.blueGrey.shade900,
                    size: 25,
                  ),
                ],
              ),
            ],
          ),
        );
        // Container(
        //     height: Dimen.bottomNav,
        //     padding: EdgeInsets.only(
        //         top: Dimen.height30,
        //         bottom: Dimen.height30,
        //         right: Dimen.width20,
        //         left: Dimen.width20),
        //     decoration: BoxDecoration(
        //       color: Colors.grey,
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(Dimen.radius20 * 2),
        //         topRight: Radius.circular(Dimen.radius20 * 2),
        //       ),
        //     ),
        //     child: cartController.getItems.length > 0
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
        //                     // GestureDetector(
        //                     //   onTap: () {
        //                     //     popularProduct.setQuantity(false);
        //                     //   },
        //                     //   child: Icon(
        //                     //     Icons.remove,
        //                     //     color: ApClrs.signClr,
        //                     //   ),
        //                     // ),
        //                     SizedBox(
        //                       width: Dimen.width5,
        //                     ),
        //                     BigText(
        //                         text: "\$" +
        //                             cartController.totalAmount.toString()),
        //                     SizedBox(
        //                       width: Dimen.width5,
        //                     ),
        //                     // GestureDetector(
        //                     //   onTap: () {
        //                     //     // popularProduct.setQuantity(true);
        //                     //   },
        //                     //   child: Icon(
        //                     //     Icons.add,
        //                     //     color: ApClrs.signClr,
        //                     //   ),
        //                     // ),
        //                   ],
        //                 ),
        //               ),
        //               GestureDetector(
        //                 onTap: () {
        //                   // popularProduct.addItem(product);
        //                   cartController.addToHistory();
        //                 },
        //                 child: Container(
        //                   padding: EdgeInsets.only(
        //                       top: Dimen.height20,
        //                       bottom: Dimen.height20,
        //                       left: Dimen.width20,
        //                       right: Dimen.width20),
        //                   child: BigText(
        //                     text: "Checkout",
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
        //         : Container(
        //             color: Colors.white,
        //           ));
      }),
    );
  }
}
