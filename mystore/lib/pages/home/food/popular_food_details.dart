import 'package:flutter/material.dart';
import 'package:mystore/cart/cart_page.dart';
import 'package:mystore/category_product/category.dart';
import 'package:mystore/controllers/cart_controller.dart';
import 'package:mystore/controllers/popular_product_controller.dart';
import 'package:mystore/pages/home/mianpage.dart';
import 'package:mystore/routes/routes_helper.dart';
import 'package:mystore/utils/app_constant.dart';
import 'package:mystore/utils/dimension.dart';
import 'package:mystore/widget/app_column.dart';
import 'package:mystore/widget/app_icon.dart';
import 'package:mystore/widget/bigtext.dart';
import 'package:mystore/widget/colors.dart';
import 'package:mystore/widget/expandble_text.dart';
import 'package:get/get.dart';

class PopularFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetails({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text(
          "Categories",
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

      body: Stack(
        children: [
          //food details image section
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(1),
              ),
              width: double.infinity,
              height: Dimen.height20 * 2.5,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (c, i) {
                    return InkWell(
                      onTap: () {
                        Get.to(CategoryList());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        margin: EdgeInsets.only(
                          top: Dimen.height10,
                          left: Dimen.width10,
                          right: Dimen.width10,
                          bottom: Dimen.height10,
                        ),
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Product",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),

                            // Column(
                            //   children: [
                            //     Container(
                            //       margin:
                            //           EdgeInsets.only(right: 10, left: 10),
                            //       padding:
                            //           EdgeInsets.only(right: 5, left: 5),
                            //       decoration: BoxDecoration(
                            //         color: Colors.blueGrey,
                            //         borderRadius: BorderRadius.circular(5),
                            //       ),
                            //       child: Column(
                            //         children: [
                            //           Text("See More"),
                            //           SizedBox(
                            //             width: Dimen.width10,
                            //           ),
                            //           GestureDetector(
                            //               onTap: () {
                            //                 Get.to(CategoryList());
                            //               },
                            //               child:
                            //                   Icon(Icons.arrow_drop_down)),
                            //           SizedBox(
                            //             width: Dimen.width5,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    );
                  }),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.cover,
              //     image:
              //         // AssetImage("assets/image/apet.jpg"),
              //         NetworkImage(AppConstants.BASE_URL +
              //             AppConstants.UPLOAD_URL +
              //             product.img!),
              //   ),
              // ),
            ),
          ),

          // food details icon section
          // Positioned(
          //   top: Dimen.height45,
          //   left: Dimen.width20,
          //   right: Dimen.width20,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       GestureDetector(
          //         onTap: () {
          //           if (page == "cart-page") {
          //             Get.toNamed(RouteHelper.getCartPage());
          //           } else {
          //             Get.toNamed(RouteHelper.getInitial());
          //           }
          //         },
          //         child: AppIcon(icon: Icons.arrow_back_ios),
          //       ),
          //       //   GetBuilder<PopularProductController>(builder: (controller) {
          //       //     return GestureDetector(
          //       //       onTap: () {
          //       //         if (controller.totalItems >= 1)
          //       //           Get.toNamed(RouteHelper.getCartPage());
          //       //       },
          //       //       child: Stack(
          //       //         children: [
          //       //           AppIcon(
          //       //             icon: Icons.shopping_cart_outlined,
          //       //           ),
          //       //           controller.totalItems >= 1
          //       //               ? Positioned(
          //       //                   right: 0,
          //       //                   top: 0,
          //       //                   child: AppIcon(
          //       //                     icon: Icons.circle,
          //       //                     size: 20,
          //       //                     iconColor: Colors.transparent,
          //       //                     backgound: ApClrs.mainClr,
          //       //                   ),
          //       //                 )
          //       //               : Container(),
          //       //           Get.find<PopularProductController>().totalItems >= 1
          //       //               ? Positioned(
          //       //                   right: 4,
          //       //                   top: 4,
          //       //                   child: BigText(
          //       //                     text: Get.find<PopularProductController>()
          //       //                         .totalItems
          //       //                         .toString(),
          //       //                     size: 12,
          //       //                     color: Colors.black,
          //       //                   ),
          //       //                 )
          //       //               : Container(),
          //       //         ],
          //       //       ),
          //       //     );
          //       //   }
          //       //  ),
          //     ],
          //   ),
          // ),

          // food details header
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   bottom: 0,
          //   top: Dimen.dettailsFood - 20,
          //   child: Container(
          //       padding: EdgeInsets.only(
          //           left: Dimen.width20,
          //           right: Dimen.width20,
          //           top: Dimen.height20),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(Dimen.radius20),
          //           topRight: Radius.circular(Dimen.radius20),
          //         ),
          //         color: Colors.white,
          //       ),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           AppColumn(text: product.name!),
          //           SizedBox(
          //             height: Dimen.height20,
          //           ),
          //           BigText(text: "Introduce"),
          //           SizedBox(
          //             height: Dimen.height20,
          //           ),
          //           Expanded(
          //             child: SingleChildScrollView(
          //               child: ExpandbleText(text: product.description!),
          //             ),
          //           ),
          //         ],
          //       )),
          // ),

          //items
          // CategoryList()
          Positioned(
            top: 50,
            left: 0,
            child: Container(
              height: 500,
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: CategoryList()),
            ),
          ),
        ],
      ),
      // bottomNavigationBar:
      // GetBuilder<PopularProductController>(builder: (popularProduct) {
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
      // }
      // ),
    );
  }
}
