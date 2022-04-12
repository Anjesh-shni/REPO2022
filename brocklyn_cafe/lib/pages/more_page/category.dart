import 'package:brocklyn_cafe/controllers/cart_controller.dart';
import 'package:brocklyn_cafe/controllers/popular_product_controller.dart';
import 'package:brocklyn_cafe/controllers/recommended_product_controller.dart';
import 'package:brocklyn_cafe/models/category_model.dart';
import 'package:brocklyn_cafe/models/product_moel.dart';
import 'package:brocklyn_cafe/routes/routes_helper.dart';
import 'package:brocklyn_cafe/utils/dimension.dart';
import 'package:brocklyn_cafe/widget/app_icon.dart';
import 'package:brocklyn_cafe/widget/bigtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({
    Key? key,

    // required this.categories,
    // required this.localproducts,
  }) : super(key: key);
  // final Category categories;
  // final LocalProduct localproducts;

//   @override
//   _CategoryPageState createState() => _CategoryPageState();
// }

// class _CategoryPageState extends State<CategoryPage> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // var product =
    //     Get.find<RecommendedProductController>().recommendedProductList[pageId];
    // Get.find<PopularProductController>()
    //     .initProduct(product, Get.find<CartController>());
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(
          "Category",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade300,
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getCartPage());
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // if (this.widget.localproducts == null) {
                  //   this.widget.categories.name.toString();
                  // }
                },
                child: GetBuilder<PopularProductController>(
                    builder: (popularproducts) {
                  return GestureDetector(
                    onTap: () {
                      popularproducts.setQuantity(true);
                    },
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: pageController,
                          itemCount: popularproducts.popularProductList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              margin: EdgeInsets.only(left: 10, right: 5),
                              decoration: BoxDecoration(
                                color: Colors.green.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 80,
                              child: Center(
                                  child: Text(
                                popularproducts.popularProductList[index].name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                            );
                          }),
                    ),
                  );
                }),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                height: 40,
                width: double.maxFinite,
                child: Text(
                  "Menu list",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              GetBuilder<RecommendedProductController>(builder: (recomended) {
                return Container(
                  height: Dimen.screenHeight,
                  child: Flexible(
                    flex: 1,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: recomended.recommendedProductList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 60,
                            padding: EdgeInsets.only(left: 10, top: 10),
                            margin: EdgeInsets.only(
                              top: 10,
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green.shade100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      recomended
                                          .recommendedProductList[index].name
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "\$${recomended.recommendedProductList[index].price.toString()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                GetBuilder<PopularProductController>(
                                    builder: (controller) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          margin: EdgeInsets.only(
                                              right: 10, bottom: 10),
                                          padding: EdgeInsets.only(
                                              left: 5,
                                              right: 5,
                                              top: 5,
                                              bottom: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // color: Colors.blueGrey,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.setQuantity(false);
                                            },
                                            child: Icon(
                                              Icons.remove_circle,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: BigText(
                                            text: " ${controller.inCartItem}"),
                                        padding: EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 5,
                                            bottom: 10),
                                        margin: EdgeInsets.only(
                                            right: 10, bottom: 10),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.setQuantity(true);
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          margin: EdgeInsets.only(
                                              right: 10, bottom: 10),
                                          padding: EdgeInsets.only(
                                              left: 5,
                                              right: 5,
                                              top: 5,
                                              bottom: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // color: Colors.blueGrey,
                                          ),
                                          child: Icon(
                                            Icons.add_circle,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                          );
                        }),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getCartPage());
            },
            child: Container(
              height: 65,
              width: double.maxFinite,
              decoration:
                  BoxDecoration(color: Colors.green.shade300, boxShadow: [
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
                          Center(
                            child: AppIcon(
                              backgound: Colors.green.shade300,
                              icon: Icons.shopping_cart_outlined,
                              iconColor: Colors.black,
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
                          SizedBox(
                            width: 5,
                          ),
                          // BigText(text: "total: \$${product.price}")
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: Row(
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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
