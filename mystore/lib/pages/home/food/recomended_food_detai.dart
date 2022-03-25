import 'package:flutter/material.dart';
import 'package:mystore/cart/cart_page.dart';
import 'package:mystore/controllers/cart_controller.dart';
import 'package:mystore/controllers/popular_product_controller.dart';
import 'package:mystore/controllers/recommended_product_controller.dart';
import 'package:mystore/routes/routes_helper.dart';
import 'package:mystore/utils/app_constant.dart';
import 'package:mystore/utils/dimension.dart';
import 'package:mystore/widget/app_icon.dart';
import 'package:mystore/widget/bigtext.dart';
import 'package:mystore/widget/colors.dart';
import 'package:mystore/widget/expandble_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetails(
      {Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (page == "cart-page") {
                      Get.toNamed(RouteHelper.getCartPage());
                    } else {
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
                // AppIcon(icon: Icons.shopping_cart_outlined),

                GetBuilder<PopularProductController>(builder: (controller) {
                  return GestureDetector(
                    onTap: () {
                      if (controller.totalItems >= 1)
                        Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: Stack(
                      children: [
                        AppIcon(
                          icon: Icons.shopping_cart_outlined,
                        ),
                        controller.totalItems >= 1
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  backgound: ApClrs.mainClr,
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
                                  color: Colors.amber,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  );
                }),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimen.height20),
              child: Container(
                decoration: BoxDecoration(
                  color: ApClrs.yllowClr,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimen.radius20),
                    topRight: Radius.circular(Dimen.radius20),
                  ),
                ),
                width: double.maxFinite,
                child: Center(
                  child: BigText(
                    text: product.name!,
                    size: Dimen.font26,
                  ),
                ),
                padding: EdgeInsets.only(
                  top: Dimen.height5,
                  bottom: Dimen.height10,
                ),
              ),
            ),
            pinned: true,
            backgroundColor: ApClrs.yllowClr,
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  //
                  Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.only(
                  left: Dimen.width20,
                  right: Dimen.width20,
                  top: Dimen.height15,
                ),
                child: Column(
                  children: [
                    Container(
                      child: ExpandbleText(
                        text: product.description!,
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimen.width20 * 2.5,
                right: Dimen.width20 * 2.5,
                top: Dimen.height10,
                bottom: Dimen.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                      iconSize: Dimen.icon24,
                      icon: Icons.remove,
                      iconColor: Colors.white,
                      backgound: ApClrs.mainClr,
                    ),
                  ),
                  BigText(
                    text: "\$${product.price!} x ${controller.inCartItem}",
                    color: ApClrs.mainBlackClr,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                      iconSize: Dimen.icon24,
                      icon: Icons.add,
                      iconColor: Colors.white,
                      backgound: ApClrs.mainClr,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Dimen.bottomNav,
              padding: EdgeInsets.only(
                  top: Dimen.height30,
                  bottom: Dimen.height30,
                  right: Dimen.width20,
                  left: Dimen.width20),
              decoration: BoxDecoration(
                color: ApClrs.btnbackgroundClr,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimen.radius20 * 2),
                  topRight: Radius.circular(Dimen.radius20 * 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimen.height20,
                        bottom: Dimen.height20,
                        left: Dimen.width20,
                        right: Dimen.width20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimen.radius20),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: ApClrs.mainClr,
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
                          bottom: Dimen.height20,
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
              ),
            ),
          ],
        );
      }
      ),
    );
  }
}
